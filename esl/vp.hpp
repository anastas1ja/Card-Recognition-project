#ifndef _VP_H_
#define _VP_H_

#include "adapter.hpp"
#include "sys_bus.hpp"
#include "ip_hard.hpp"
#include "bram.hpp"
#include "cpu.hpp"
uint8_t r = read_bram(in_addr + i*3 + 0);
uint8_t g = read_bram(in_addr + i*3 + 1);
uint8_t b = read_bram(in_addr + i*3 + 2);

class vp : public sc_core::sc_module
{
public:
    Sys_bus*  sb;
    Ip_hard*  ip;
    Bram*     ram;
    Cpu*      cpu;

    vp(sc_core::sc_module_name name, char** args, int argc);
    ~vp();
};

#endif // _VP_H_
