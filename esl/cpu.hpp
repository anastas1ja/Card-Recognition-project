#ifndef _CPU_H_
#define _CPU_H_

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>
#include "adapter.hpp"   // includes SystemC + OpenCV (for image loading only)
#include "addr.hpp"

class Cpu : public sc_core::sc_module
{
public:
    SC_HAS_PROCESS(Cpu);

    Cpu(sc_core::sc_module_name name, char** argv, int argc);

    // Socket to system bus
    tlm_utils::simple_initiator_socket<Cpu> bus_socket;

protected:
    void software_thread();

    // ── TLM register helpers ──────────────────────────────────────────────────
    void     write_phys      (uint32_t addr, uint32_t data);
    uint32_t read_phys       (uint32_t addr);

    // ── BRAM bulk transfer (DMI-accelerated) ─────────────────────────────────
    // Write raw RGB frame to BRAM at given address
    void write_frame_to_bram (const uint8_t* rgb, int w, int h, uint32_t addr);

    // ── String helpers ────────────────────────────────────────────────────────
    static const char* rankName (int r);
    static const char* suitName (int s);

    // CLI arguments
    char** argv;
    int    argc;
};

#endif // _CPU_H_
