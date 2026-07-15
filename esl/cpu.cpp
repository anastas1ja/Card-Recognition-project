// cpu.cpp  –  Software layer for Card-Recognition Virtual Platform
//
// Responsibilities:
//   1. Load one card image from disk (only disk read in the entire system).
//   2. Write the raw RGB frame to BRAM via DMI (fast path) or b_transport.
//   3. Configure IP_HARD registers and assert START.
//   4. Poll STATUS until READY.
//   5. Read CARD_RANK and CARD_SUIT from IP registers.
//   6. Print exactly one line with the following: "Card Rank : <rank> | Card Suit <suit>"  (e.g. "Card Rank : queen | Card Suit: spades").
//
// OpenCV is used exclusively for step 1 (imread).  Everything else is plain C++.

#include "cpu.hpp"
#include <iostream>

using namespace sc_core;

// ─── String tables ────────────────────────────────────────────────────────────

const char* Cpu::rankName(int r) {
    static const char* n[] = {
        "unknown","two","three","four","five","six","seven",
        "eight","nine","ten","jack","queen","king","ace"
    };
    return (r >= 0 && r <= 13) ? n[r] : "unknown";
}

const char* Cpu::suitName(int s) {
    static const char* n[] = {"hearts","diamonds","clubs","spades"};
    return (s >= 0 && s < 4) ? n[s] : "unknown";
}

// ─── Constructor ──────────────────────────────────────────────────────────────

Cpu::Cpu(sc_module_name name, char** _argv, int _argc)
    : sc_module(name), argv(_argv), argc(_argc)
{
    SC_THREAD(software_thread);
}

// ─── Main software thread ─────────────────────────────────────────────────────

void Cpu::software_thread()
{
    sc_time t_start = sc_time_stamp();

    // ── [1] Load image from disk (only disk I/O in VP) ────────────────────────
    if (argc < 2) {
        std::cerr << "Usage: ./vp <path_to_card_image>\n";
        sc_stop(); return;
    }

    cv::Mat img = cv::imread(argv[1], cv::IMREAD_COLOR);
    if (img.empty()) {
        std::cerr << "CPU: cannot open " << argv[1] << "\n";
        sc_stop(); return;
    }

    const int W = img.cols;
    const int H = img.rows;

    // Safety check against BRAM budget
    if ((uint32_t)(W * H * 3) > (BRAM_RESULT_ADDR - BRAM_INPUT_FRAME_ADDR)) {
        std::cerr << "CPU: image too large for BRAM ("
                  << W << "x" << H << ")\n";
        sc_stop(); return;
    }

    // OpenCV stores BGR; stb_image stores RGB.  Our IP algorithm uses
    // the same convention as was used in the standalone main.cpp (RGB order
    // fed to the grayscale formula).  Convert Mat → flat RGB buffer.
    std::vector<uint8_t> rgbBuf(W * H * 3);
    for (int y = 0; y < H; ++y) {
        for (int x = 0; x < W; ++x) {
            cv::Vec3b px = img.at<cv::Vec3b>(y, x);
            int base = (y * W + x) * 3;
            rgbBuf[base + 0] = px[2]; // R
            rgbBuf[base + 1] = px[1]; // G
            rgbBuf[base + 2] = px[0]; // B
        }
    }
    // img is no longer needed
    img.release();

    // Simulate SW image-load overhead (~100 µs realistic)
    wait(100, SC_US);

    // ── [2] Write frame to BRAM via DMI ───────────────────────────────────────
    sc_time t_write_start = sc_time_stamp();
    write_frame_to_bram(rgbBuf.data(), W, H, BRAM_INPUT_FRAME_ADDR);
    sc_time t_write = sc_time_stamp() - t_write_start;

    // ── [3] Configure IP_HARD registers ───────────────────────────────────────
    write_phys(VP_IP_CORE_ADDR_LOW + ADDR_FRAME_WIDTH,    (uint32_t)W);
    write_phys(VP_IP_CORE_ADDR_LOW + ADDR_FRAME_HEIGHT,   (uint32_t)H);
    write_phys(VP_IP_CORE_ADDR_LOW + ADDR_INPUT_ADDR_REG,  BRAM_INPUT_FRAME_ADDR);
    write_phys(VP_IP_CORE_ADDR_LOW + ADDR_OUTPUT_ADDR_REG, BRAM_RESULT_ADDR);

    // ── [4] Assert START ───────────────────────────────────────────────────────
    sc_time t_ip_start = sc_time_stamp();
    write_phys(VP_IP_CORE_ADDR_LOW + ADDR_CTRL_REG, CTRL_START_BIT);

    // ── [5] Poll STATUS_REG until READY ───────────────────────────────────────
    uint32_t status;
    do {
        wait(100, SC_NS);
        status = read_phys(VP_IP_CORE_ADDR_LOW + ADDR_STATUS_REG);
    } while ((status & STATUS_READY_BIT) == 0);

    sc_time t_ip = sc_time_stamp() - t_ip_start;

    // ── [6] Read results ───────────────────────────────────────────────────────
    uint32_t rank = read_phys(VP_IP_CORE_ADDR_LOW + ADDR_CARD_RANK_REG);
    uint32_t suit = read_phys(VP_IP_CORE_ADDR_LOW + ADDR_CARD_SUIT_REG);

    // ── [7] Single-line result (required output format) ───────────────────────
    std::cout << "Card Rank : " << rankName((int)rank) << " | " << "Card Suit : " << suitName((int)suit) << "\n";

    // ── [8] Performance summary ────────────────────────────────────────────────
    sc_time t_total = sc_time_stamp() - t_start;
    std::cout << "\n=== Performance ===\n"
              << "  BRAM write      : " << t_write  << "\n"
              << "  HW accel        : " << t_ip     << "\n"
              << "  Total           : " << t_total  << "\n"
              << "  Processing rate : "
              << (1.0 / t_total.to_seconds()) << " fps\n"
              << "===================\n";

    sc_stop();
}

// ─── TLM register-level helpers ───────────────────────────────────────────────

void Cpu::write_phys(uint32_t addr, uint32_t data) {
    tlm::tlm_generic_payload pl;
    sc_time offset = SC_ZERO_TIME;
    pl.set_command(tlm::TLM_WRITE_COMMAND);
    pl.set_address(addr);
    pl.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
    pl.set_data_length(4);
    pl.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
    bus_socket->b_transport(pl, offset);
    wait(offset);
}

uint32_t Cpu::read_phys(uint32_t addr) {
    uint32_t data = 0;
    tlm::tlm_generic_payload pl;
    sc_time offset = SC_ZERO_TIME;
    pl.set_command(tlm::TLM_READ_COMMAND);
    pl.set_address(addr);
    pl.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
    pl.set_data_length(4);
    pl.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
    bus_socket->b_transport(pl, offset);
    wait(offset);
    return data;
}

// ─── DMI-accelerated bulk frame write ────────────────────────────────────────

void Cpu::write_frame_to_bram(const uint8_t* rgb, int w, int h, uint32_t addr)
{
    const uint32_t total_bytes = (uint32_t)(w * h * 3);

    tlm::tlm_generic_payload pl;
    tlm::tlm_dmi dmi_data;
    pl.set_address(addr);
    pl.set_command(tlm::TLM_WRITE_COMMAND);

    bool dmi_ok = bus_socket->get_direct_mem_ptr(pl, dmi_data);

    if (dmi_ok && dmi_data.is_write_allowed()) {
        // ── Fast path: memcpy directly into BRAM ──────────────────────────────
        unsigned char* dmi_ptr = dmi_data.get_dmi_ptr();
        uint32_t offset = addr - (uint32_t)dmi_data.get_start_address();
        std::memcpy(dmi_ptr + offset, rgb, total_bytes);

        // Model AXI4 burst transfer time (32-bit bus @ 100 MHz, 80% efficiency)
        uint32_t  num_xfers = (total_bytes + 3) / 4;
        sc_time   xfer_time = sc_time(50 + num_xfers * 10, SC_NS)
                            + dmi_data.get_write_latency();
        wait(xfer_time);
    } else {
        // ── Slow path: byte-by-byte b_transport ───────────────────────────────
        for (uint32_t i = 0; i < total_bytes; ++i) {
            uint8_t byte = rgb[i];
            tlm::tlm_generic_payload bpl;
            sc_time boff = SC_ZERO_TIME;
            bpl.set_command(tlm::TLM_WRITE_COMMAND);
            bpl.set_address(addr + i);
            bpl.set_data_ptr(&byte);
            bpl.set_data_length(1);
            bpl.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
            bus_socket->b_transport(bpl, boff);
            wait(boff);
        }
    }
}
