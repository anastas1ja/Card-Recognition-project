#ifndef _BRAM_H_
#define _BRAM_H_

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_target_socket.h>
#include "addr.hpp"

class Bram : public sc_core::sc_module
{
public:
    Bram(sc_core::sc_module_name name);
    ~Bram();

    // Two target sockets: one from SysBus (CPU side), one from IP_HARD
    tlm_utils::simple_target_socket<Bram> soft_socket;
    tlm_utils::simple_target_socket<Bram> ip_socket;

    // Backdoor pointer for VP destructor (save result image)
    unsigned char* get_mem_ptr() { return mem; }

protected:
    void b_transport(tlm::tlm_generic_payload& pl, sc_core::sc_time& offset);
    bool get_direct_mem_ptr(tlm::tlm_generic_payload& pl, tlm::tlm_dmi& dmi_data);

    unsigned char mem[BRAM_SIZE];
};

#endif // _BRAM_H_
