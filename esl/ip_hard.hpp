#ifndef _IP_HARD_H_
#define _IP_HARD_H_

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_target_socket.h>
#include <tlm_utils/simple_initiator_socket.h>
#include <array>
#include <cstdint>
#include "addr.hpp"

using namespace sc_core;
using namespace sc_dt;

// ─── Geometry helpers (pure data, no I/O) ────────────────────────────────────
struct Point2f { float x, y; };

// ─── IP_HARD: Card-Recognition Hardware Accelerator ──────────────────────────
//
// Register map (offsets from base):
//   0x00  ADDR_FRAME_WIDTH      – image width  written by CPU before START
//   0x04  ADDR_FRAME_HEIGHT     – image height written by CPU before START
//   0x08  ADDR_CTRL_REG         – bit0 = START
//   0x0C  ADDR_STATUS_REG       – bit0 = READY (1 when done)
//   0x10  ADDR_INPUT_ADDR_REG   – BRAM base of RGB input frame
//   0x14  ADDR_OUTPUT_ADDR_REG  – BRAM address of result area (unused by HW,
//                                  results go directly to rank/suit regs)
//   0x18  ADDR_CARD_RANK_REG    – detected rank  (read by CPU after READY)
//   0x1C  ADDR_CARD_SUIT_REG    – detected suit  (read by CPU after READY)

class Ip_hard : public sc_module
{
public:
    SC_HAS_PROCESS(Ip_hard);

    Ip_hard(sc_module_name name);
    ~Ip_hard();

    // TLM sockets
    tlm_utils::simple_target_socket<Ip_hard>    soft_socket;  // CPU → IP registers
    tlm_utils::simple_initiator_socket<Ip_hard> bram_socket;  // IP → BRAM

    // Synchronisation events
    sc_event start_event;
    sc_event done_event;

protected:
    // TLM register-access handler
    void b_transport(tlm::tlm_generic_payload& pl, sc_time& offset);

    // Main processing thread (runs forever, wakes on start_event)
    void ip_thread();

    // ── Pipeline stages ───────────────────────────────────────────────────────
    // All operate on in-RAM buffers; no cout, no file I/O.
    void     stage_toGrayscale  (const uint8_t* src, uint8_t* dst, int w, int h);
    void     stage_binarize     (uint8_t* data, int n, int thr);
    void     stage_binarizeTo   (const uint8_t* src, uint8_t* dst, int n, int thr);
    void     stage_binarizeRaw  (const uint8_t* src, uint8_t* dst,
                                  int w, int h, int ch, int thr = 120);

    // Returns count of points in the largest component, written into outBuf.
    // Caller provides visited/queue/region to allow multiple independent calls
    // without clobbering each other (main pipeline vs matcher sub-calls).
    int      stage_findLargest  (const uint8_t* binary, int w, int h,
                                  Point2f* outBuf,
                                  bool* visited, Point2f* queue, Point2f* region);
    int      stage_findLargestCcl(const uint8_t* binary, int w, int h,
                                  Point2f* outBuf);
    std::array<Point2f,4>
             stage_findCorners  (const Point2f* pts, int n);
    void     stage_warpImage    (const uint8_t* src, int srcW, int srcH,
                                  const std::array<Point2f,4>& corners,
                                  uint8_t* dst, int dstW, int dstH);
    void     stage_cropTopLeft  (const uint8_t* src, int srcW,
                                  uint8_t* dst, int cW, int cH);
    void     stage_splitSymbol  (const uint8_t* src, int w, int h,
                                  uint8_t* rankBuf, int& rankH,
                                  uint8_t* suitBuf, int& suitH);

    int      stage_rankMatcher  (const uint8_t* gray, int w, int h);
    int      stage_matchSuit    (const uint8_t* gray, int w, int h);

    // BRAM single-byte helpers (keep pixel-level timing)
    uint8_t  read_bram  (uint32_t addr);
    void     write_bram (uint32_t addr, uint8_t data);

    // ── Registers ─────────────────────────────────────────────────────────────
    sc_uint<1>  ctrl_start;
    sc_uint<1>  ctrl_reset;
    sc_uint<1>  status_ready;
    sc_uint<32> input_addr;
    sc_uint<32> output_addr;
    sc_uint<32> frame_width;
    sc_uint<32> frame_height;
    sc_uint<32> card_rank;   // result: rank index
    sc_uint<32> card_suit;   // result: suit index

    // ── Working memory (static-sized, allocated at construction) ──────────────
    // Max input: 640×480×3 = 921 600 B
    static constexpr int MAX_PX = FRAME_WIDTH_MAX * FRAME_HEIGHT_MAX;

    uint8_t*  work_rgb;       // MAX_PX*3 B     – raw RGB from BRAM (Phase 4 src)
    uint8_t*  work_gray;      // MAX_PX bytes   – grayscale of full input
    uint8_t*  work_binary;    // MAX_PX bytes   – binarised full input
    Point2f*  work_comp;      // MAX_PX points  – BFS component buffer (card outline)
    uint8_t*  work_warped;    // 200*300*3 B    – perspective-corrected card
    uint8_t*  work_corner;    // 33*90*3  B     – top-left corner crop
    uint8_t*  work_grayC;     // 33*90    B     – grayscale corner
    uint8_t*  work_binC;      // 33*90    B     – binarised corner
    uint8_t*  work_sym;       // 33*90*3  B     – symbol crop
    uint8_t*  work_rankRGB;   // 33*90*3  B     – rank strip
    uint8_t*  work_suitRGB;   // 33*90*3  B     – suit strip
    uint8_t*  work_rankGray;  // 33*90    B     – rank grayscale
    uint8_t*  work_suitGray;  // 33*90    B     – suit grayscale

    // BFS internals for main pipeline (card outline detection)
    bool*     bfs_visited;    // MAX_PX bools
    Point2f*  bfs_queue;      // MAX_PX points
    Point2f*  bfs_region;     // MAX_PX points

    // Separate BFS internals for matcher sub-calls (rank/suit crop)
    // Must not share with above – matchers are called from ip_thread
    // after main BFS has already written work_comp.
    bool*     mbfs_visited;   // 33*90 bools
    Point2f*  mbfs_queue;     // 33*90 points
    Point2f*  mbfs_region;    // 33*90 points
};

#endif // _IP_HARD_H_
