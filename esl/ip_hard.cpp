// ip_hard.cpp  –  Card-Recognition Hardware Accelerator (SystemC TL-2.0)


#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"
#include "adapter.hpp"
#include "ip_hard.hpp"
#include <cmath>
#include <cstring>
#include <algorithm>
#include <climits>
#include <cstdio>
#include <vector>
#include <opencv2/opencv.hpp>
using namespace sc_core;
using namespace sc_dt;

// Constructor / Destructor
static float _ptDist(Point2f a, Point2f b) {
    return std::sqrt((a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y));
}

Ip_hard::Ip_hard(sc_module_name name) : sc_module(name)
{
    soft_socket.register_b_transport(this, &Ip_hard::b_transport);

    ctrl_start   = 0;  ctrl_reset   = 0;
    status_ready = 1;
    input_addr   = BRAM_INPUT_FRAME_ADDR;
    output_addr  = BRAM_RESULT_ADDR;
    frame_width  = 0;  frame_height = 0;
    card_rank    = 0;  card_suit    = 0;

    // ── Main pipeline buffers ─────────────────────────────────────────────────
    work_rgb     = new uint8_t [MAX_PX * 3]; 
    work_gray    = new uint8_t [MAX_PX];
    work_binary  = new uint8_t [MAX_PX];
    work_comp    = new Point2f [MAX_PX];
    work_warped  = new uint8_t [200 * 300 * 3];
    work_corner  = new uint8_t [50 * 120 * 3];
    work_grayC   = new uint8_t [50 * 120];
    work_binC    = new uint8_t [50 * 120];
    work_sym     = new uint8_t [50 * 120 * 3];
    work_rankRGB = new uint8_t [50 * 120 * 3];
    work_suitRGB = new uint8_t [50 * 120 * 3];
    work_rankGray= new uint8_t [50 * 120];
    work_suitGray= new uint8_t [50 * 120];

    // ── Main BFS buffers (card outline) ──────────────────────────────────────
    bfs_visited  = new bool    [MAX_PX];
    bfs_queue    = new Point2f [MAX_PX];
    bfs_region   = new Point2f [MAX_PX];

    // ── Matcher BFS buffers (rank/suit crop) ─────────────────────
    mbfs_visited = new bool    [50 * 120];
    mbfs_queue   = new Point2f [50 * 120];
    mbfs_region  = new Point2f [50 * 120];

    SC_THREAD(ip_thread);
}

Ip_hard::~Ip_hard()
{
    delete[] work_rgb;    delete[] work_gray;   delete[] work_binary;
    delete[] work_comp;   delete[] work_warped; delete[] work_corner;
    delete[] work_grayC;  delete[] work_binC;   delete[] work_sym;
    delete[] work_rankRGB;delete[] work_suitRGB;
    delete[] work_rankGray;delete[] work_suitGray;
    delete[] bfs_visited; delete[] bfs_queue;   delete[] bfs_region;
    delete[] mbfs_visited;delete[] mbfs_queue;  delete[] mbfs_region;
}


// b_transport  –  register-level access from CPU

void Ip_hard::b_transport(tlm::tlm_generic_payload& pl, sc_time& offset)
{
    tlm::tlm_command cmd  = pl.get_command();
    uint64_t         addr = pl.get_address();
    unsigned char*   data = pl.get_data_ptr();

    if (cmd == tlm::TLM_WRITE_COMMAND) {
        uint32_t v = *reinterpret_cast<uint32_t*>(data);
        switch (addr) {
            case ADDR_FRAME_WIDTH:     frame_width  = v; break;
            case ADDR_FRAME_HEIGHT:    frame_height = v; break;
            case ADDR_INPUT_ADDR_REG:  input_addr   = v; break;
            case ADDR_OUTPUT_ADDR_REG: output_addr  = v; break;
            case ADDR_CTRL_REG:
                ctrl_start = v & CTRL_START_BIT;
                ctrl_reset = v & CTRL_RESET_BIT;
                if (ctrl_start == 1) start_event.notify();
                break;
            default: break;
        }
    } else if (cmd == tlm::TLM_READ_COMMAND) {
        uint32_t v = 0;
        switch (addr) {
            case ADDR_FRAME_WIDTH:     v = frame_width .to_uint(); break;
            case ADDR_FRAME_HEIGHT:    v = frame_height.to_uint(); break;
            case ADDR_CTRL_REG:        v = ctrl_start  .to_uint(); break;
            case ADDR_STATUS_REG:      v = status_ready.to_uint(); break;
            case ADDR_INPUT_ADDR_REG:  v = input_addr  .to_uint(); break;
            case ADDR_OUTPUT_ADDR_REG: v = output_addr .to_uint(); break;
            case ADDR_CARD_RANK_REG:   v = card_rank   .to_uint(); break;
            case ADDR_CARD_SUIT_REG:   v = card_suit   .to_uint(); break;
            default: break;
        }
        *reinterpret_cast<uint32_t*>(data) = v;
    }

    offset += sc_time(INTERCONNECT_DELAY, SC_NS);
    pl.set_response_status(tlm::TLM_OK_RESPONSE);
}

// ═══════════════════════════════════════════════════════════════════════════════
// ip_thread  –  main processing loop
// ═══════════════════════════════════════════════════════════════════════════════

void Ip_hard::ip_thread()
{
    while (true) {
        wait(start_event);

        std::remove("debug_binary_full.png");
        std::remove("debug_warped_card.png");
        std::remove("debug_roi_rgb.png");
        std::remove("debug_roi_binary.png");
        std::remove("debug_rank_binary.png");
        std::remove("debug_suit_binary.png");

        status_ready = 0;
        ctrl_start   = 0;

        const int W       = (int)frame_width .to_uint();
        const int H       = (int)frame_height.to_uint();
        const int N       = W * H;
        uint32_t  in_addr = input_addr.to_uint();

        // ── PHASE 1: read RGB from BRAM + compute grayscale per pixel ─────────
        // work_rgb  ← raw RGB   (needed for warp in Phase 4)
        // work_gray ← grayscale (needed for binarise in Phase 2)
        for (int i = 0; i < N; ++i) {
            uint8_t r = read_bram(in_addr + (uint32_t)(i * 3 + 0));
            uint8_t g = read_bram(in_addr + (uint32_t)(i * 3 + 1));
            uint8_t b = read_bram(in_addr + (uint32_t)(i * 3 + 2));
            work_rgb [i * 3 + 0] = r;
            work_rgb [i * 3 + 1] = g;
            work_rgb [i * 3 + 2] = b;
            work_gray[i] = static_cast<uint8_t>(0.299f*r + 0.587f*g + 0.114f*b);
            wait(5, SC_NS);   // HW pixel processing latency
        }

        // ── PHASE 2: binarise grayscale → work_binary ─────────────────────────
        stage_binarizeTo(work_gray, work_binary, N, 120);
        wait(sc_time(N, SC_NS));
        stbi_write_png("debug_binary_full.png", W, H, 1, work_binary, W);

        // ── PHASE 3: BFS – find largest white component (card outline) ────────
        // Uses bfs_visited / bfs_queue / bfs_region.
        // Result stored in work_comp[0..compCount-1].
        // FIX BUG2: wait(5, SC_NS) per visited node is inside stage_findLargest.
        // CCL replacement for main card-outline detection.
        int compCount = stage_findLargestCcl(work_binary, W, H, work_comp);
        if (compCount < 100) {
            card_rank = 0; card_suit = 0;
            status_ready = 1; done_event.notify();
            continue;
        }

        // ── PHASE 4: perspective warp → 200×300 RGB ───────────────────────────
        // FIX BUG1: use work_rgb (not work_comp) as source.
        // work_comp still contains valid Point2f corner data from Phase 3.
               // ── PHASE 4: perspective warp ───────────────────────────────────────────
        auto corners = stage_findCorners(work_comp, compCount);

        // DINAMIČKO RAČUNANJE PRAVE ŠIRINE I VISINE KARTE
        float top_w    = _ptDist(corners[0], corners[1]); // Gornja ivica
        float bottom_w = _ptDist(corners[3], corners[2]); // Donja ivica
        float left_h   = _ptDist(corners[0], corners[3]); // Leva ivica
        float right_h  = _ptDist(corners[1], corners[2]); // Desna ivica

        int finalW = (int)((top_w + bottom_w) / 2.0f);
        int finalH = (int)((left_h + right_h) / 2.0f);

        // Bezbednosna provera (ako je detekcija loša, vrati na 200x300)
        if (finalW < 10 || finalH < 10) { finalW = 200; finalH = 300; }

        stage_warpImage(work_rgb, W, H, corners, work_warped, finalW, finalH);
        wait(sc_time(finalW * finalH, SC_NS));
        stbi_write_png("debug_warped_card.png", finalW, finalH, 3, work_warped, finalW * 3);
        // ── PHASE 5: crop top-left 50×120 ─────────────────────────────────────
        stage_cropLeftColumn(work_warped, 200, work_corner, 50, 120); //zameni sa 300?
        stbi_write_png("debug_roi_rgb.png", 50, 120, 3, work_corner, 50 * 3);

        // ── PHASE 6: grayscale + binarise corner ──────────────────────────────
        stage_toGrayscale(work_corner, work_grayC, 50, 120);
        stage_binarizeTo(work_grayC, work_binC, 50 * 120, 120);
        wait(sc_time(50 * 120, SC_NS));
        stbi_write_png("debug_roi_binary.png", 50, 120, 1, work_binC, 50);

        int leftEdge = 0;
        int rightEdge = 49;
        for (int x = 0; x < 12; ++x) {
            int colInk = 0;
            for (int y = 0; y < 120; ++y)
                if (work_binC[y * 50 + x] == 0) ++colInk;
            if (colInk > 40) leftEdge = x + 1;
        }
        for (int x = 49; x >= 38; --x) {
            int colInk = 0;
            for (int y = 0; y < 120; ++y)
                if (work_binC[y * 50 + x] == 0) ++colInk;
            if (colInk > 40) rightEdge = x - 1;
        }

           // ── PHASE 7: find rank and suit using pure C++ row scanning ────────────
        int rankStartY = 0, rankEndY = 0;
        int suitStartY = 0, suitEndY = 0;
        int rankMinX = 50, rankMaxX = 0, suitMinX = 50, suitMaxX = 0;

        bool inRank = false;
        int emptyRows = 0;
        const int MIN_EMPTY_GAP = 4; 

        for (int y = 0; y < 300; ++y) {
            int ink = 0;
            for (int x = 0; x < 50; ++x) {
                if (work_binC[y * 50 + x] == 0) ink++; // 0 je crna mastila
            }

            if (ink > 0) {
                if (!inRank) {
                    inRank = true;
                    rankStartY = y;
                }
                if (inRank) {
                    rankEndY = y;
                    for (int x = 0; x < 50; ++x) {
                        if (work_binC[y * 50 + x] == 0) {
                            if (x < rankMinX) rankMinX = x;
                            if (x > rankMaxX) rankMaxX = x;
                        }
                    }
                } else {
                    suitEndY = y;
                    for (int x = 0; x < 50; ++x) {
                        if (work_binC[y * 50 + x] == 0) {
                            if (x < suitMinX) suitMinX = x;
                            if (x > suitMaxX) suitMaxX = x;
                        }
                    }
                }
                emptyRows = 0;
            } else {
                emptyRows++;
                if (inRank && emptyRows > MIN_EMPTY_GAP) {
                    inRank = false;
                    suitStartY = y + 1;
                }
            }
        }

        // Zaštita ako nismo našli Suit
        if (suitStartY == 0) {
            suitStartY = rankEndY + 5;
            suitEndY = 299;
        }

        // Provera da li je detekcija uspela
        if (rankEndY <= rankStartY || suitEndY <= suitStartY) {
            card_rank = 0; card_suit = 0;
            status_ready = 1; done_event.notify();
            continue;
        }

        // =================================================================
        // OVDE DEKLARIŠEMO rankW i suitW (kompajler ih ovde traži!)
        // =================================================================
        int rankW = rankMaxX - rankMinX + 1;
        int suitW = suitMaxX - suitMinX + 1;
        int rankH = rankEndY - rankStartY + 1 + 4; // +4 za marginu
        int suitH = suitEndY - suitStartY + 1 + 4; // +4 za marginu

        // Bezbednosno ograničenje margina
        rankMinX = std::max(0, rankMinX - 2); rankMaxX = std::min(49, rankMaxX + 2);
        suitMinX = std::max(0, suitMinX - 2); suitMaxX = std::min(49, suitMaxX + 2);

        // Iseci Rank u work_rankRGB
        for (int y = 0; y < rankH; ++y)
            for (int x = 0; x < rankW; ++x)
                for (int c = 0; c < 3; ++c)
                    work_rankRGB[(y * rankW + x) * 3 + c] = 
                        work_corner[((rankStartY - 2 + y) * 50 + (rankMinX + x)) * 3 + c];

        // Iseci Suit u work_suitRGB
        for (int y = 0; y < suitH; ++y)
            for (int x = 0; x < suitW; ++x)
                for (int c = 0; c < 3; ++c)
                    work_suitRGB[(y * suitW + x) * 3 + c] = 
                        work_corner[((suitStartY - 2 + y) * 50 + (suitMinX + x)) * 3 + c];
        // ── PHASE 8: split rank (top 60%) / suit (bottom 40%) ─────────────────
        int rankH = 0, suitH = 0;
        stage_splitSymbol(work_sym, symW, symH,
                          work_rankRGB, rankH,
                          work_suitRGB, suitH);

         // ── PHASE 9: grayscale + binarise rank & suit strips ──────────────────
        stage_toGrayscale(work_rankRGB, work_rankGray, rankW, rankH);
        stage_toGrayscale(work_suitRGB, work_suitGray, suitW, suitH);
        
        // Ispis pre binarizacije (samo za debug)
        stbi_write_png("debug_rank_gray.png", rankW, rankH, 1, work_rankGray, rankW);
        stbi_write_png("debug_suit_gray.png", suitW, suitH, 1, work_suitGray, suitW);

        stage_binarize(work_rankGray, rankW * rankH, 120);
        stage_binarize(work_suitGray, suitW * suitH, 120);
        
        stbi_write_png("debug_rank_binary.png", rankW, rankH, 1, work_rankGray, rankW);
        stbi_write_png("debug_suit_binary.png", suitW, suitH, 1, work_suitGray, suitW);
        // ── PHASE 10: template matching ───────────────────────────────────────
        // matchers receive mbfs_* so they never touch bfs_* / work_comp.
        int rank = stage_rankMatcher(work_rankGray, symW, rankH);
        int suit = stage_matchSuit  (work_suitGray, symW, suitH);

        card_rank = (rank >= 0) ? (uint32_t)rank : 0u;
        card_suit = (suit >= 0) ? (uint32_t)suit : 0u;

        // Write packed results to BRAM result region
        uint32_t res = output_addr.to_uint();
        uint32_t r32 = card_rank.to_uint();
        uint32_t s32 = card_suit.to_uint();
        for (int bi = 0; bi < 4; ++bi) write_bram(res + bi,     (r32 >> (bi*8)) & 0xFF);
        for (int bi = 0; bi < 4; ++bi) write_bram(res + 4 + bi, (s32 >> (bi*8)) & 0xFF);

        status_ready = 1;
        done_event.notify();
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// Pipeline stage implementations
// ═══════════════════════════════════════════════════════════════════════════════

void Ip_hard::stage_toGrayscale(const uint8_t* src, uint8_t* dst, int w, int h) {
    int n = w * h;
    for (int i = 0; i < n; ++i)
        dst[i] = static_cast<uint8_t>(0.299f * src[i*3] +
                                       0.587f * src[i*3+1] +
                                       0.114f * src[i*3+2]);
}

void Ip_hard::stage_binarize(uint8_t* data, int n, int thr) {
    for (int i = 0; i < n; ++i)
        data[i] = (data[i] < thr) ? 255 : 0;
}

void Ip_hard::stage_binarizeTo(const uint8_t* src, uint8_t* dst, int n, int thr) {
    for (int i = 0; i < n; ++i)
        dst[i] = (src[i] > thr) ? 255 : 0;
}

void Ip_hard::stage_binarizeRaw(const uint8_t* src, uint8_t* dst,
                                 int w, int h, int ch, int thr) {
    int n = w * h;
    for (int i = 0; i < n; ++i) {
        uint8_t g = 0;
        if (ch == 1) {
            g = src[i];
        } else {
            g = static_cast<uint8_t>(
                src[i*ch+0] * 0.30f +
                (ch > 1 ? src[i*ch+1] * 0.59f : 0.0f) +
                (ch > 2 ? src[i*ch+2] * 0.11f : 0.0f));
        }
        dst[i] = (g > thr) ? 255 : 0;
    }
}

// ── BFS – generalised, uses caller-supplied buffers ──────────────────────────


static float _ptDist(Point2f a, Point2f b);

int Ip_hard::stage_findLargest(const uint8_t* binary, int w, int h,
                                Point2f* outBuf,
                                bool* visited, Point2f* queue, Point2f* region)
{
    const int n = w * h;
    std::fill(visited, visited + n, false);

    const int dx[4] = {1,-1,0,0}, dy[4] = {0,0,1,-1};
    int bestCount = 0;

    for (int y = 0; y < h; ++y) {
        for (int x = 0; x < w; ++x) {
            int idx = y * w + x;
            if (binary[idx] != 255 || visited[idx]) continue;

            int qHead = 0, qTail = 0, regCount = 0;
            queue[qTail++]  = {(float)x, (float)y};
            visited[idx]    = true;

            while (qHead < qTail) {
                Point2f p = queue[qHead++];
                region[regCount++] = p;
                wait(5, SC_NS);   // FIX BUG2: HW BFS node latency

                for (int d = 0; d < 4; ++d) {
                    int nx = (int)p.x + dx[d];
                    int ny = (int)p.y + dy[d];
                    if (nx >= 0 && ny >= 0 && nx < w && ny < h) {
                        int nidx = ny * w + nx;
                        if (binary[nidx] == 255 && !visited[nidx]) {
                            visited[nidx] = true;
                            queue[qTail++] = {(float)nx, (float)ny};
                        }
                    }
                }
            }

            if (regCount > bestCount) {
                bestCount = regCount;
                std::copy(region, region + regCount, outBuf);
            }
        }
    }
    return bestCount;
}

int Ip_hard::stage_findLargestCcl(const uint8_t* binary, int w, int h,
                                  Point2f* outBuf)
{
    const int n = w * h;
    const int maxLabels = n + 1;

    std::vector<int> labels(n, 0);
    std::vector<int> prevLabel(w, 0);
    std::vector<int> currLabel(w, 0);
    std::vector<int> parent(maxLabels, 0);
    std::vector<int> count(maxLabels, 0);

    auto rootOf = [&](int label) {
        int r = label;
        while (parent[r] != r) r = parent[r];
        while (parent[label] != label) {
            int next = parent[label];
            parent[label] = r;
            label = next;
        }
        return r;
    };

    auto mergeLabels = [&](int keep, int drop) {
        if (keep == drop || keep == 0 || drop == 0 || count[drop] == 0) return keep;

        count[keep] += count[drop];
        count[drop] = 0;
        parent[drop] = keep;
        return keep;
    };

    int nextLabel = 1;

    for (int y = 0; y < h; ++y) {
        std::fill(currLabel.begin(), currLabel.end(), 0);

        for (int x = 0; x < w; ++x) {
            int idx = y * w + x;
            if (binary[idx] != 255) continue;

            int left = (x > 0) ? currLabel[x - 1] : 0;
            int up = prevLabel[x];
            int chosen = 0;

            if (left != 0) chosen = rootOf(left);
            if (up != 0) {
                int upRoot = rootOf(up);
                if (chosen == 0) {
                    chosen = upRoot;
                } else if (chosen != upRoot) {
                    int keep = (chosen < upRoot) ? chosen : upRoot;
                    int drop = (chosen < upRoot) ? upRoot : chosen;
                    chosen = mergeLabels(keep, drop);
                }
            }

            if (chosen == 0) {
                chosen = nextLabel++;
                if (chosen >= maxLabels) break;
                parent[chosen] = chosen;
                count[chosen] = 0;
            }

            chosen = rootOf(chosen);
            currLabel[x] = chosen;
            labels[idx] = chosen;
            count[chosen]++;
        }

        prevLabel.swap(currLabel);
        wait(sc_time(w, SC_NS));
    }

    int bestLabel = 0;
    int bestCount = 0;
    for (int label = 1; label < nextLabel; ++label) {
        if (parent[label] == label && count[label] > bestCount) {
            bestCount = count[label];
            bestLabel = label;
        }
    }

    if (bestLabel == 0) {
        return 0;
    }

    int outCount = 0;
    for (int y = 0; y < h; ++y) {
        for (int x = 0; x < w; ++x) {
            int idx = y * w + x;
            int label = labels[idx];
            if (label != 0 && rootOf(label) == bestLabel) {
                outBuf[outCount++] = {(float)x, (float)y};
            }
        }
    }

    return outCount;
}



std::array<Point2f,4> Ip_hard::stage_findCorners(const Point2f* pts, int n) {
    if (n == 0) return {Point2f{0,0}, Point2f{0,0}, Point2f{0,0}, Point2f{0,0}};
    
    float min_sum = 1e9f, max_sum = -1e9f;
    float min_diff = 1e9f, max_diff = -1e9f; // diff = x - y
    Point2f tl{0,0}, br{0,0}, tr{0,0}, bl{0,0};

    for (int i = 0; i < n; ++i) {
        float s = pts[i].x + pts[i].y;
        float d = pts[i].x - pts[i].y;
        if (s < min_sum) { min_sum = s; tl = pts[i]; } // Gornji levi (min suma)
        if (s > max_sum) { max_sum = s; br = pts[i]; } // Donji desni (max suma)
        if (d > max_diff) { max_diff = d; tr = pts[i]; } // Gornji desni (max razlika)
        if (d < min_diff) { min_diff = d; bl = pts[i]; } // Donji levi (min razlika)
    }
    
    // Vraćamo tačno redosled: TL, TR, BR, BL (potreban za getPerspectiveTransform)
    return {tl, tr, br, bl};
}



void Ip_hard::stage_warpImage(const uint8_t* src, int srcW, int srcH,
                               const std::array<Point2f,4>& corners,
                               uint8_t* dst, int dstW, int dstH)
{
    // 1. Definiši izvorne tačke (4 ugla)
    std::vector<cv::Point2f> srcPoints;
    for(const auto& p : corners) {
        srcPoints.push_back(cv::Point2f(p.x, p.y));
    }

    // 2. Definiši ciljne tačke (pravougaonik 200x300)
    std::vector<cv::Point2f> dstPoints;
    dstPoints.push_back(cv::Point2f(0.0f, 0.0f));                 // Gornji levi
    dstPoints.push_back(cv::Point2f((float)(dstW - 1), 0.0f));          // Gornji desni
    dstPoints.push_back(cv::Point2f((float)(dstW - 1), (float)(dstH - 1)));   // Donji desni
    dstPoints.push_back(cv::Point2f(0.0f, (float)(dstH - 1)));          // Donji levi

    // 3. Izračunaj matricu transformacije
    cv::Mat M = cv::getPerspectiveTransform(srcPoints, dstPoints);

    // 4. Obavijte vaše baferove u OpenCV Mat strukture (Nema kopiranja podataka!)
    cv::Mat inputMat(srcH, srcW, CV_8UC3, (void*)src);
    cv::Mat outputMat(dstH, dstW, CV_8UC3, (void*)dst);

    // 5. Izvrši perspektivnu transformaciju direktno u vaš izlazni bafer
    // Korišćenje INTER_LINEAR daje najbolji odnos kvaliteta i brzine
       // 5. Izvrši perspektivnu transformaciju
    // BORDER_CONSTANT + Scalar(255,255,255) popunjava ostatak BELOM bojom
    cv::warpPerspective(inputMat, outputMat, M, cv::Size(dstW, dstH),
                        cv::INTER_LINEAR, cv::BORDER_CONSTANT, cv::Scalar(255, 255, 255));
}
void Ip_hard::stage_cropLeftColumn(const uint8_t* src, int srcW,
                                 uint8_t* dst, int cW, int cH) {
   for (int y = 0; y < cH; ++y) {
    std::memcpy(&dst[y * cW * 3], &src[y * srcW * 3], cW * 3 * sizeof(uint8_t));
}
}

void Ip_hard::stage_splitSymbol(const uint8_t* src, int w, int h,
                                 uint8_t* rankBuf, int& rankH,
                                 uint8_t* suitBuf, int& suitH) {
    int mid = static_cast<int>(h * 0.60f);
    std::vector<int> rowInk(h, 0);
    int rankBandW = std::max(8, w * 65 / 100);

    for (int y = 0; y < h; ++y) {
        int ink = 0;
        for (int x = 0; x < rankBandW; ++x) {
            int idx = (y * w + x) * 3;
            int gray = (int)(src[idx + 0] * 0.30f +
                             src[idx + 1] * 0.59f +
                             src[idx + 2] * 0.11f);
            if (gray < 120) ++ink;
        }
        rowInk[y] = ink;
    }

    int lo = std::max(2, h * 42 / 100);
    int hi = std::min(h - 3, h * 78 / 100);
    int bestY = mid;
    int bestWin = rankBandW * 3 + 1;

    for (int y = lo; y <= hi; ++y) {
        int aboveInk = 0, belowInk = 0;
        for (int k = 2; k <= 8; ++k) {
            if (y - k >= 0) aboveInk += rowInk[y - k];
            if (y + k < h) belowInk += rowInk[y + k];
        }
        if (aboveInk < rankBandW / 2 || belowInk < rankBandW / 2) continue;

        int win = rowInk[y - 1] + rowInk[y] + rowInk[y + 1];
        if (win < bestWin) {
            bestWin = win;
            bestY = y;
        }
    }

    if (bestWin <= std::max(3, rankBandW / 3)) {
        mid = bestY;
    }

    rankH = mid; suitH = h - mid;
    std::fill(rankBuf, rankBuf + (w * rankH * 3), 255);
    std::fill(suitBuf, suitBuf + (w * suitH * 3), 255);

    int rankCopyW = w;
    for (int y = 0; y < mid; ++y)
        for (int x = 0; x < rankCopyW; ++x)
            for (int c = 0; c < 3; ++c)
                rankBuf[(y*w+x)*3+c] = src[(y*w+x)*3+c];

    for (int y = 0; y < suitH; ++y)
        for (int x = 0; x < w; ++x)
            for (int c = 0; c < 3; ++c)
                suitBuf[(y*w+x)*3+c] = src[((y+mid)*w+x)*3+c];
}

// ── Template matchers (use mbfs_* to avoid clobbering main pipeline) ─────────

int Ip_hard::stage_rankMatcher(const uint8_t* grayData, int w, int h) {
    static const struct { const char* file; int rank; } T[] = {
        {"Card_Imgs/Ranks/2.jpg",     1}, {"Card_Imgs/Ranks/3.jpg",     2},
        {"Card_Imgs/Ranks/4.jpg",     3}, {"Card_Imgs/Ranks/5.jpg",     4},
        {"Card_Imgs/Ranks/6.jpg",     5}, {"Card_Imgs/Ranks/7.jpg",     6},
        {"Card_Imgs/Ranks/8.jpg",     7}, {"Card_Imgs/Ranks/9.jpg",     8},
        {"Card_Imgs/Ranks/0.jpg",     9}, {"Card_Imgs/Ranks/jack.jpg", 10},
        {"Card_Imgs/Ranks/queen.jpg",11}, {"Card_Imgs/Ranks/king.jpg", 12},
        {"Card_Imgs/Ranks/ace.jpg",  13}
    };
    const int NT = 13;
    const int BUF = 50 * 120;

    uint8_t* inv_buf = work_rankGray;   // safe to reuse: caller won't read it again
    uint8_t  cropped[BUF];
    Point2f  cBuf[BUF];

    int n = w * h;
    for (int i = 0; i < n; ++i) inv_buf[i] = 255 - grayData[i];

    // FIX BUG3: use mbfs_* not bfs_*
    int cCount = stage_findLargest(inv_buf, w, h, cBuf,
                                   mbfs_visited, mbfs_queue, mbfs_region);
    if (cCount == 0) return -1;

    float minX=(float)w, maxX=0, minY=(float)h, maxY=0;
    for (int i = 0; i < cCount; ++i) {
        minX = std::min(minX, cBuf[i].x); maxX = std::max(maxX, cBuf[i].x);
        minY = std::min(minY, cBuf[i].y); maxY = std::max(maxY, cBuf[i].y);
    }
    minX = std::max(0.0f, minX-2); minY = std::max(0.0f, minY-2);
    maxX = std::min((float)w-1, maxX+2); maxY = std::min((float)h-1, maxY+2);

    int cW = (int)(maxX - minX + 1), cH = (int)(maxY - minY + 1);
    if (cW <= 0 || cH <= 0) return -1;
    for (int y = 0; y < cH; ++y)
        for (int x = 0; x < cW; ++x)
            cropped[y*cW+x] = inv_buf[(int)(minY+y)*w + (int)(minX+x)];

    int bestMatch = -1;
    float bestScore = 1e9f;
    static uint8_t resized[300*300], tplBin[300*300];

    for (int t = 0; t < NT; ++t) {
        int tW, tH, tC;
        uint8_t* tplRaw = stbi_load(T[t].file, &tW, &tH, &tC, 0);
        if (!tplRaw) continue;

        float xR = (float)cW/tW, yR = (float)cH/tH;
        for (int y = 0; y < tH; ++y)
            for (int x = 0; x < tW; ++x)
                resized[y*tW+x] = cropped[(int)(y*yR)*cW + (int)(x*xR)];

        stage_binarizeRaw(tplRaw, tplBin, tW, tH, tC);
        stbi_image_free(tplRaw);

        int falsePos = 0, falseNeg = 0, unionInk = 0;
        for (int i = 0; i < tW*tH; ++i) {
            bool a = (resized[i] == 0);
            bool b = (tplBin[i] == 0);
            if (a || b) ++unionInk;
            if (a && !b) ++falsePos;
            if (!a && b) ++falseNeg;
        }

        float score = (unionInk > 0)
                    ? (float)(falsePos + falseNeg) / (float)unionInk
                    : 1e9f;
        if (score < bestScore) {
            bestScore = score;
            bestMatch = T[t].rank;
        }
    }
    return bestMatch;
}

int Ip_hard::stage_matchSuit(const uint8_t* grayData, int w, int h) {
    static const struct { const char* file; int suit; } T[] = {
        {"Card_Imgs/Suits/hearts.jpg",   0},
        {"Card_Imgs/Suits/diamonds.jpg", 1},
        {"Card_Imgs/Suits/clubs.jpg",    2},
        {"Card_Imgs/Suits/spades.jpg",   3}
    };
    const int NT  = 4;
    const int BUF = 50 * 120;

    uint8_t* inv_buf = work_suitGray;   // safe to reuse
    uint8_t  cropped[BUF];
    Point2f  cBuf[BUF];

    int n = w * h;
    for (int i = 0; i < n; ++i) inv_buf[i] = 255 - grayData[i];

    // FIX BUG3: use mbfs_*
    int cCount = stage_findLargest(inv_buf, w, h, cBuf,
                                   mbfs_visited, mbfs_queue, mbfs_region);
    if (cCount == 0) return -1;

    float minX=(float)w, maxX=0, minY=(float)h, maxY=0;
    for (int i = 0; i < cCount; ++i) {
        minX = std::min(minX, cBuf[i].x); maxX = std::max(maxX, cBuf[i].x);
        minY = std::min(minY, cBuf[i].y); maxY = std::max(maxY, cBuf[i].y);
    }
    minX = std::max(0.0f, minX-2); minY = std::max(0.0f, minY-2);
    maxX = std::min((float)w-1, maxX+2); maxY = std::min((float)h-1, maxY+2);

    int cW = (int)(maxX - minX + 1), cH = (int)(maxY - minY + 1);
    if (cW <= 0 || cH <= 0) return -1;
    for (int y = 0; y < cH; ++y)
        for (int x = 0; x < cW; ++x)
            cropped[y*cW+x] = inv_buf[(int)(minY+y)*w + (int)(minX+x)];

    int bestMatch = -1;
    float bestScore = 1e9f;
    static uint8_t resized[300*300], tplBin[300*300];

    for (int t = 0; t < NT; ++t) {
        int tW, tH, tC;
        uint8_t* tplRaw = stbi_load(T[t].file, &tW, &tH, &tC, 0);
        if (!tplRaw) continue;

        float xR = (float)cW/tW, yR = (float)cH/tH;
        for (int y = 0; y < tH; ++y)
            for (int x = 0; x < tW; ++x)
                resized[y*tW+x] = cropped[(int)(y*yR)*cW + (int)(x*xR)];

        stage_binarizeRaw(tplRaw, tplBin, tW, tH, tC);
        stbi_image_free(tplRaw);

        int diff = 0;
        for (int i = 0; i < tW*tH; ++i)
            if (resized[i] != tplBin[i]) ++diff;

        float score = (float)diff / (float)(tW * tH);
        if (score < bestScore) {
            bestScore = score;
            bestMatch = T[t].suit;
        }
    }
    return bestMatch;
}

// ═══════════════════════════════════════════════════════════════════════════════
// BRAM single-byte helpers
// ═══════════════════════════════════════════════════════════════════════════════

uint8_t Ip_hard::read_bram(uint32_t addr) {
    tlm::tlm_generic_payload pl;
    sc_time offset = sc_time(10, SC_NS);
    uint8_t data;
    pl.set_command(tlm::TLM_READ_COMMAND);
    pl.set_address(addr);
    pl.set_data_ptr(&data);
    pl.set_data_length(1);
    pl.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
    bram_socket->b_transport(pl, offset);
    return data;
}

void Ip_hard::write_bram(uint32_t addr, uint8_t data) {
    tlm::tlm_generic_payload pl;
    sc_time offset = sc_time(10, SC_NS);
    pl.set_command(tlm::TLM_WRITE_COMMAND);
    pl.set_address(addr);
    pl.set_data_ptr(&data);
    pl.set_data_length(1);
    pl.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
    bram_socket->b_transport(pl, offset);
}
