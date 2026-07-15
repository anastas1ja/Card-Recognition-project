// testbench.cpp
#include <iostream>
#include <cstring>
#include <chrono>
#include <ap_int.h>

static const int WIDTH = 160;
static const int HEIGHT = 120;
static const int N = WIDTH * HEIGHT;

// Deklaracija tvoje HLS funkcije (iz card_recognizer_hw.cpp)
extern void card_recognizer_hw(
    ap_uint<24> input_rgb[N],
    unsigned int* result_rank,
    unsigned int* result_suit,
    int width,
    int height
);

// Ucitavanje slike (samo za CSim)
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

int main(int argc, char* argv[]) {
    // Baferi (static za velike nizove)
    static ap_uint<24> input_rgb[N];

    unsigned int card_pixel_count, top_left_roi_count;
    
    // Putanja do slike (prvi argument ili podrazumijevana)
    const char* image_path = (argc > 1) ? argv[1] : "C:/Users/astan/Desktop/moj_esl/esl/esl/karta.jpeg";

    std::cout << "\n========================================" << std::endl;
    std::cout << "  CARD COMPONENT ANALYSIS HLS SIMULATION" << std::endl;
    std::cout << "========================================\n" << std::endl;

    // ===== 1. UCITAVANJE SLIKE (samo u CSim) =====
    std::cout << "[1] Ucitavanje slike: " << image_path << std::endl;

    int img_w, img_h, channels;
    unsigned char* img = stbi_load(image_path, &img_w, &img_h, &channels, 3);

    if (!img) {
        std::cerr << "Greska: izabrana slika se ne moze ucitati pravilno " << image_path << std::endl;
        return 1;
    }

    std::cout << "    Slika ucitana: " << img_w << "x" << img_h
              << ", kanala: " << channels << std::endl;

    if (img_w != WIDTH || img_h != HEIGHT) {
        std::cout << "    Napomena: testbench koristi 160x120 packed-RGB bafer; veca slika se sece, manja se dopunjava nulama." << std::endl;
    }

    // Kopiraj u packed RGB bafer: 0x00BBGGRR.
    memset(input_rgb, 0, sizeof(input_rgb));
    int copy_w = (img_w < WIDTH) ? img_w : WIDTH;
    int copy_h = (img_h < HEIGHT) ? img_h : HEIGHT;
    int src_start_x = (img_w > WIDTH) ? (img_w - WIDTH) / 2 : 0;
    int src_start_y = (img_h > HEIGHT) ? (img_h - HEIGHT) / 2 : 0;
    int dst_start_x = (WIDTH > img_w) ? (WIDTH - img_w) / 2 : 0;
    int dst_start_y = (HEIGHT > img_h) ? (HEIGHT - img_h) / 2 : 0;
    
    for (int y = 0; y < copy_h; ++y) {
        for (int x = 0; x < copy_w; ++x) {
            int src = ((src_start_y + y) * img_w + (src_start_x + x)) * 3;
            int dst = (dst_start_y + y) * WIDTH + (dst_start_x + x);
            unsigned int r = img[src];
            unsigned int g = img[src+1];
            unsigned int b = img[src+2];
            input_rgb[dst] = r | (g << 8) | (b << 16);
        }
    }
    
    stbi_image_free(img);

    // ===== 2. POKRETANJE HARDVERA =====
    std::cout << "\n[2] Pokretanje hardverske akceleracije..." << std::endl;

    auto start = std::chrono::high_resolution_clock::now();

    card_recognizer_hw(input_rgb, &card_pixel_count, &top_left_roi_count, WIDTH, HEIGHT);

    auto end = std::chrono::high_resolution_clock::now();
    auto duration_us = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    auto duration_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    // ===== 3. ISPIS REZULTATA =====
    std::cout << "\n[3] REZULTATI ANALIZE:" << std::endl;
    std::cout << "    ===================" << std::endl;
    std::cout << "    Card bbox white-pixel count: " << card_pixel_count << std::endl;
    std::cout << "    Top-left ROI white-pixel count: " << top_left_roi_count << std::endl;
    std::cout << "    ===================" << std::endl;

    // ===== 4. TIMING NOTE =====
    std::cout << "\n[4] NAPOMENA ZA VREME:" << std::endl;
    std::cout << "    ---------------------------------" << std::endl;
    std::cout << "    CSim simulacija: " << duration_us.count() << " us ("
              << duration_ms.count() << " ms)" << std::endl;
    std::cout << "    Ovo je funkcionalna simulacija na CPU-u." << std::endl;
    std::cout << "    Stvarno hardversko vreme citamo posle C Synthesis:" << std::endl;
    std::cout << "    estimated clock, latency/II po petljama i resurse." << std::endl;
    std::cout << "    ---------------------------------" << std::endl;
        std::cout << "\n========================================" << std::endl;
    std::cout << "  SIMULACIJA ZAVRSENA!" << std::endl;
    std::cout << "========================================\n" << std::endl;
    
    return 0;
}
