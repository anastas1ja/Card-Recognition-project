#ifndef _SYS_BUS_H_
#define _SYS_BUS_H_

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_target_socket.h>
#include <tlm_utils/simple_initiator_socket.h>
#include "addr.hpp"

class Sys_bus : public sc_core::sc_module
{
public:
    Sys_bus(sc_core::sc_module_name name);
    ~Sys_bus();

    tlm_utils::simple_target_socket<Sys_bus>    soft_socket;       // CPU → Bus
    tlm_utils::simple_initiator_socket<Sys_bus> bram_socket;       // Bus → BRAM
    tlm_utils::simple_initiator_socket<Sys_bus> ip_hard_socket;    // Bus → IP_HARD

protected:
    void b_transport       (tlm::tlm_generic_payload& pl, sc_core::sc_time& offset);
    bool get_direct_mem_ptr(tlm::tlm_generic_payload& pl, tlm::tlm_dmi& dmi_data);
};

#endif // _SYS_BUS_H_
