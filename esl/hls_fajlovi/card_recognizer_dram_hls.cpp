// card_recognizer_bram_hls.cpp
// HLS analysis block with packed RGB input and internal BRAM working buffers.

#include <ap_int.h>

static const int IMG_WIDTH = 160;
static const int IMG_HEIGHT = 120;
static const int IMG_PIXELS = IMG_WIDTH * IMG_HEIGHT;
static const int MAX_COMPONENTS = 256;

typedef ap_uint<24> rgb_word_t;   // packed as 0xBBGGRR
typedef ap_uint<8>  pixel_t;
typedef ap_uint<1>  flag_t;
typedef ap_uint<8>  coord_t;
typedef ap_uint<8>  label_t;

struct BBox {
    coord_t min_x;
    coord_t min_y;
    coord_t max_x;
    coord_t max_y;
    unsigned int count;
    flag_t valid;
};

void to_grayscale(
    const rgb_word_t input_rgb[IMG_PIXELS],
    pixel_t gray[IMG_PIXELS],
    int width, int height
) {
    int n = width * height;
    GRAYSCALE_LOOP:
    for (int i = 0; i < n; ++i) {
#pragma HLS LOOP_TRIPCOUNT min=19200 max=19200
#pragma HLS PIPELINE II=1
        rgb_word_t pix = input_rgb[i];
        unsigned int r = pix.range(7, 0);
        unsigned int g = pix.range(15, 8);
        unsigned int b = pix.range(23, 16);
        gray[i] = (pixel_t)((77u * r + 150u * g + 29u * b) >> 8);
    }
}

void binarize(
    const pixel_t gray[IMG_PIXELS],
    flag_t binary[IMG_PIXELS],
    int n, int thr
) {
    BINARIZE_LOOP:
    for (int i = 0; i < n; ++i) {
#pragma HLS LOOP_TRIPCOUNT min=19200 max=19200
#pragma HLS PIPELINE II=1
        binary[i] = (gray[i] > thr) ? 1 : 0;
    }
}

label_t find_root(const label_t parent[MAX_COMPONENTS], label_t label) {
#pragma HLS INLINE
    label_t p1 = parent[label];
    label_t p2 = parent[p1];
    return p2;
}

void merge_components(
    label_t parent[MAX_COMPONENTS],
    coord_t min_x[MAX_COMPONENTS],
    coord_t min_y[MAX_COMPONENTS],
    coord_t max_x[MAX_COMPONENTS],
    coord_t max_y[MAX_COMPONENTS],
    unsigned int count[MAX_COMPONENTS],
    label_t keep,
    label_t drop
) {
#pragma HLS INLINE
    if (keep == 0 || drop == 0 || keep == drop || count[drop] == 0) {
        return;
    }

    if (min_x[drop] < min_x[keep]) min_x[keep] = min_x[drop];
    if (min_y[drop] < min_y[keep]) min_y[keep] = min_y[drop];
    if (max_x[drop] > max_x[keep]) max_x[keep] = max_x[drop];
    if (max_y[drop] > max_y[keep]) max_y[keep] = max_y[drop];
    count[keep] += count[drop];
    count[drop] = 0;
    parent[drop] = keep;
}

BBox find_largest_component_ccl(
    const flag_t binary[IMG_PIXELS],
    int width, int height
) {
    label_t prev_label[IMG_WIDTH];
    label_t curr_label[IMG_WIDTH];
    label_t parent[MAX_COMPONENTS];
    coord_t min_x[MAX_COMPONENTS];
    coord_t min_y[MAX_COMPONENTS];
    coord_t max_x[MAX_COMPONENTS];
    coord_t max_y[MAX_COMPONENTS];
    unsigned int count[MAX_COMPONENTS];

#pragma HLS ARRAY_PARTITION variable=prev_label cyclic factor=2
#pragma HLS ARRAY_PARTITION variable=curr_label cyclic factor=2

    INIT_COMPONENTS:
    for (int i = 0; i < MAX_COMPONENTS; ++i) {
#pragma HLS LOOP_TRIPCOUNT min=256 max=256
#pragma HLS PIPELINE II=1
        parent[i] = (label_t)i;
        min_x[i] = IMG_WIDTH - 1;
        min_y[i] = IMG_HEIGHT - 1;
        max_x[i] = 0;
        max_y[i] = 0;
        count[i] = 0;
    }

    INIT_ROWS:
    for (int x = 0; x < IMG_WIDTH; ++x) {
#pragma HLS LOOP_TRIPCOUNT min=160 max=160
#pragma HLS PIPELINE II=1
        prev_label[x] = 0;
        curr_label[x] = 0;
    }

    int next_label = 1;

    CCL_Y_LOOP:
    for (int y = 0; y < height; ++y) {
#pragma HLS LOOP_TRIPCOUNT min=120 max=120
        CLEAR_CURR_ROW:
        for (int x = 0; x < IMG_WIDTH; ++x) {
#pragma HLS LOOP_TRIPCOUNT min=160 max=160
#pragma HLS PIPELINE II=1
            curr_label[x] = 0;
        }

        CCL_X_LOOP:
        for (int x = 0; x < width; ++x) {
#pragma HLS LOOP_TRIPCOUNT min=160 max=160
            int idx = y * width + x;

            if (binary[idx]) {
                label_t left = (x > 0) ? curr_label[x - 1] : (label_t)0;
                label_t up = prev_label[x];
                label_t chosen = 0;

                if (left != 0) {
                    chosen = find_root(parent, left);
                }

                if (up != 0) {
                    label_t up_root = find_root(parent, up);
                    if (chosen == 0) {
                        chosen = up_root;
                    } else if (chosen != up_root) {
                        label_t keep = (chosen < up_root) ? chosen : up_root;
                        label_t drop = (chosen < up_root) ? up_root : chosen;
                        merge_components(parent, min_x, min_y, max_x, max_y, count, keep, drop);
                        chosen = keep;
                    }
                }

                if (chosen == 0 && next_label < MAX_COMPONENTS) {
                    chosen = (label_t)next_label;
                    parent[chosen] = chosen;
                    min_x[chosen] = (coord_t)x;
                    min_y[chosen] = (coord_t)y;
                    max_x[chosen] = (coord_t)x;
                    max_y[chosen] = (coord_t)y;
                    count[chosen] = 0;
                    next_label++;
                }

                if (chosen != 0) {
                    label_t root = find_root(parent, chosen);
                    curr_label[x] = root;

                    coord_t cx = (coord_t)x;
                    coord_t cy = (coord_t)y;
                    if (cx < min_x[root]) min_x[root] = cx;
                    if (cy < min_y[root]) min_y[root] = cy;
                    if (cx > max_x[root]) max_x[root] = cx;
                    if (cy > max_y[root]) max_y[root] = cy;
                    count[root]++;
                }
            }
        }

        COPY_ROW:
        for (int x = 0; x < IMG_WIDTH; ++x) {
#pragma HLS LOOP_TRIPCOUNT min=160 max=160
#pragma HLS PIPELINE II=1
            prev_label[x] = curr_label[x];
        }
    }

    BBox best;
    best.min_x = IMG_WIDTH - 1;
    best.min_y = IMG_HEIGHT - 1;
    best.max_x = 0;
    best.max_y = 0;
    best.count = 0;
    best.valid = 0;

    SELECT_BEST:
    for (int i = 1; i < MAX_COMPONENTS; ++i) {
#pragma HLS LOOP_TRIPCOUNT min=255 max=255
#pragma HLS PIPELINE II=1
        if (parent[i] == i && count[i] > best.count) {
            best.min_x = min_x[i];
            best.min_y = min_y[i];
            best.max_x = max_x[i];
            best.max_y = max_y[i];
            best.count = count[i];
            best.valid = 1;
        }
    }

    return best;
}

unsigned int analyze_top_left_roi(
    const flag_t binary[IMG_PIXELS],
    BBox card_box,
    int width
) {
    if (!card_box.valid) {
        return 0;
    }

    int box_w = (int)card_box.max_x - (int)card_box.min_x + 1;
    int box_h = (int)card_box.max_y - (int)card_box.min_y + 1;

    int roi_w = box_w / 4;
    int roi_h = box_h / 3;
    if (roi_w < 1) roi_w = 1;
    if (roi_h < 1) roi_h = 1;

    int x0 = card_box.min_x;
    int y0 = card_box.min_y;
    int x1 = x0 + roi_w;
    int y1 = y0 + roi_h;

    unsigned int roi_count = 0;

    ROI_Y_LOOP:
    for (int y = 0; y < IMG_HEIGHT; ++y) {
#pragma HLS LOOP_TRIPCOUNT min=120 max=120
        ROI_X_LOOP:
        for (int x = 0; x < IMG_WIDTH; ++x) {
#pragma HLS LOOP_TRIPCOUNT min=160 max=160
#pragma HLS PIPELINE II=1
            if (y >= y0 && y < y1 && x >= x0 && x < x1) {
                int idx = y * width + x;
                if (binary[idx]) {
                    roi_count++;
                }
            }
        }
    }

    return roi_count;
}

void card_recognizer_hw(
    rgb_word_t input_rgb[IMG_PIXELS],
    unsigned int* result_rank,
    unsigned int* result_suit,
    int width,
    int height
) {
#pragma HLS INTERFACE mode=ap_memory port=input_rgb storage_type=ram_2p latency=1
#pragma HLS INTERFACE s_axilite port=result_rank
#pragma HLS INTERFACE s_axilite port=result_suit
#pragma HLS INTERFACE s_axilite port=width
#pragma HLS INTERFACE s_axilite port=height
#pragma HLS INTERFACE s_axilite port=return

    static pixel_t gray[IMG_PIXELS];
    static flag_t binary[IMG_PIXELS];

#pragma HLS BIND_STORAGE variable=gray type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=binary type=ram_2p impl=bram

    int n = width * height;

    to_grayscale(input_rgb, gray, width, height);
    binarize(gray, binary, n, 120);
    BBox card_box = find_largest_component_ccl(binary, width, height);
    unsigned int roi_count = analyze_top_left_roi(binary, card_box, width);

    *result_rank = card_box.count;
    *result_suit = roi_count;
}
