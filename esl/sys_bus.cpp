#include "sys_bus.hpp"
#include <iostream>

using namespace sc_core;

Sys_bus::Sys_bus(sc_module_name name) : sc_module(name)
{
    soft_socket.register_b_transport      (this, &Sys_bus::b_transport);
    soft_socket.register_get_direct_mem_ptr(this, &Sys_bus::get_direct_mem_ptr);
    std::cout << "SYS_BUS: Initialised\n";
}

Sys_bus::~Sys_bus() {}

// ── Address decoder ────────────────────────────────────────────────────────────

void Sys_bus::b_transport(tlm::tlm_generic_payload& pl, sc_time& offset)
{
    uint64_t addr = pl.get_address();

    if (addr >= VP_BRAM_ADDR_LOW && addr < VP_BRAM_ADDR_HIGH) {
        offset += sc_time(INTERCONNECT_DELAY, SC_NS);
        bram_socket->b_transport(pl, offset);
    }
    else if (addr >= VP_IP_CORE_ADDR_LOW && addr < VP_IP_CORE_ADDR_HIGH) {
        uint64_t local = addr - VP_IP_CORE_ADDR_LOW;
        pl.set_address(local);
        offset += sc_time(INTERCONNECT_DELAY, SC_NS);
        ip_hard_socket->b_transport(pl, offset);
        pl.set_address(addr);   // restore
    }
    else {
        std::cerr << "SYS_BUS: invalid address 0x" << std::hex << addr
                  << std::dec << "\n";
        pl.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
    }
}

bool Sys_bus::get_direct_mem_ptr(tlm::tlm_generic_payload& pl, tlm::tlm_dmi& dmi_data)
{
    uint64_t addr = pl.get_address();

    if (addr >= VP_BRAM_ADDR_LOW && addr < VP_BRAM_ADDR_HIGH) {
        pl.set_address(addr - VP_BRAM_ADDR_LOW);
        bool ok = bram_socket->get_direct_mem_ptr(pl, dmi_data);
        pl.set_address(addr);

        if (ok) {
            // Translate DMI region back to global address space
            dmi_data.set_start_address(dmi_data.get_start_address() + VP_BRAM_ADDR_LOW);
            dmi_data.set_end_address  (dmi_data.get_end_address()   + VP_BRAM_ADDR_LOW);
        }
        return ok;
    }

    return false;   // IP_HARD and invalid addresses have no DMI
}
