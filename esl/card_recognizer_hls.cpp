// find_largest_hls.cpp - BEZ vector, BEZ queue!
#include <iostream>

struct Point2f {
    float x, y;
};

// SAMO BFS - BEZ std::vector, BEZ std::queue!
int find_largest_component_hw(
    const unsigned char binary[640*480],
    int width,
    int height,
    Point2f out_points[640*480]
) {
    #pragma HLS INTERFACE m_axi port=binary depth=307200
    #pragma HLS INTERFACE m_axi port=out_points depth=307200
    #pragma HLS INTERFACE s_axilite port=width
    #pragma HLS INTERFACE s_axilite port=height
    #pragma HLS INTERFACE s_axilite port=return
    
    const int dx[4] = {1, -1, 0, 0};
    const int dy[4] = {0, 0, 1, -1};
    const int n = width * height;

    // Statički baferi (globalni - ne na steku)
    static bool visited[640*480];
    static Point2f queue[640*480];
    static Point2f region[640*480];
    
    // Inicijalizuj visited
    for (int i = 0; i < n; ++i) {
        #pragma HLS PIPELINE II=1
        visited[i] = false;
    }
    
    int best_count = 0;
    
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            int idx = y * width + x;
            
            if (binary[idx] != 255 || visited[idx]) continue;
            
            // BFS
            int q_head = 0, q_tail = 0;
            int reg_count = 0;
            
            queue[q_tail++] = {(float)x, (float)y};
            visited[idx] = true;
            
            while (q_head < q_tail) {
                #pragma HLS PIPELINE II=1
                Point2f p = queue[q_head++];
                region[reg_count++] = p;
                
                for (int d = 0; d < 4; ++d) {
                    int nx = (int)p.x + dx[d];
                    int ny = (int)p.y + dy[d];
                    
                    if (nx >= 0 && ny >= 0 && nx < width && ny < height) {
                        int nidx = ny * width + nx;
                        if (binary[nidx] == 255 && !visited[nidx]) {
                            visited[nidx] = true;
                            queue[q_tail++] = {(float)nx, (float)ny};
                        }
                    }
                }
            }
            
            if (reg_count > best_count) {
                best_count = reg_count;
                for (int i = 0; i < reg_count; ++i) {
                    #pragma HLS PIPELINE II=1
                    out_points[i] = region[i];
                }
            }
        }
    }
    
    return best_count;
}

// TOP funkcija
void card_recognizer_hw(
    unsigned char input_rgb[640*480*3],
    unsigned int* result_rank,
    unsigned int* result_suit,
    int width,
    int height
) {
    #pragma HLS INTERFACE m_axi port=input_rgb depth=921600
    #pragma HLS INTERFACE s_axilite port=result_rank
    #pragma HLS INTERFACE s_axilite port=result_suit
    #pragma HLS INTERFACE s_axilite port=width
    #pragma HLS INTERFACE s_axilite port=height
    #pragma HLS INTERFACE s_axilite port=return
    
    static unsigned char gray[640*480];
    static unsigned char binary[640*480];
    static Point2f points[640*480];

    const int n = width * height;
    
    // Grayscale konverzija
    for (int i = 0; i < n; ++i) {
        #pragma HLS PIPELINE II=1
        unsigned char r = input_rgb[i*3];
        unsigned char g = input_rgb[i*3+1];
        unsigned char b = input_rgb[i*3+2];
        gray[i] = (unsigned char)(0.299f * r + 0.587f * g + 0.114f * b);
    }
    
    // Binarizacija
    for (int i = 0; i < n; ++i) {
        #pragma HLS PIPELINE II=1
        binary[i] = (gray[i] > 120) ? 255 : 0;
    }
    
    // BFS - find_largest_component
    int comp_size = find_largest_component_hw(binary, width, height, points);
    
    // Test rezultat (za sintezu)
    *result_rank = (comp_size > 10000) ? 10 : 0;
    *result_suit = 0;
}
