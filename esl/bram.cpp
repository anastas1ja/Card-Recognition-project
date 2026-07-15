#include "bram.hpp"
#include <iostream>
#include <cstring>

using namespace sc_core;

Bram::Bram(sc_module_name name) : sc_module(name)
{
    soft_socket.register_b_transport      (this, &Bram::b_transport);
    ip_socket  .register_b_transport      (this, &Bram::b_transport);
    soft_socket.register_get_direct_mem_ptr(this, &Bram::get_direct_mem_ptr);
    ip_socket  .register_get_direct_mem_ptr(this, &Bram::get_direct_mem_ptr);

    memset(mem, 0, BRAM_SIZE);

    std::cout << "BRAM: " << BRAM_SIZE / 1024 << " KB initialised (DMI enabled)\n";
}

Bram::~Bram() {}

void Bram::b_transport(tlm::tlm_generic_payload& pl, sc_time& offset)
{
    uint64_t       addr = pl.get_address();
    unsigned char* data = pl.get_data_ptr();
    unsigned int   len  = pl.get_data_length();

    if (addr + len > BRAM_SIZE) {
        pl.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
        std::cerr << "BRAM: address out of range: 0x" << std::hex << addr
                  << " len=" << std::dec << len << "\n";
        return;
    }

    if (pl.get_command() == tlm::TLM_READ_COMMAND)
        memcpy(data, &mem[addr], len);
    else
        memcpy(&mem[addr], data, len);

    offset += sc_time(5, SC_NS);
    pl.set_response_status(tlm::TLM_OK_RESPONSE);
}

bool Bram::get_direct_mem_ptr(tlm::tlm_generic_payload& pl, tlm::tlm_dmi& dmi_data)
{
    uint64_t addr = pl.get_address();
    if (addr >= BRAM_SIZE) return false;

    dmi_data.set_dmi_ptr(mem);
    dmi_data.set_start_address(0);
    dmi_data.set_end_address(BRAM_SIZE - 1);
    dmi_data.set_read_latency (sc_time(5, SC_NS));
    dmi_data.set_write_latency(sc_time(5, SC_NS));
    dmi_data.allow_read_write();
    return true;
}
