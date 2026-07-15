// vp.cpp  –  Top-level Virtual Platform


#include "vp.hpp"


vp::vp(sc_core::sc_module_name name, char** args, int argc)
    : sc_module(name)
{
    sb  = new Sys_bus ("sys_bus");
    ip  = new Ip_hard ("ip_hard");
    ram = new Bram    ("bram");
    cpu = new Cpu     ("cpu", args, argc);

    // 1. CPU → SysBus
    cpu->bus_socket    .bind(sb->soft_socket);

    // 2. SysBus → BRAM
    sb->bram_socket    .bind(ram->soft_socket);

    // 3. SysBus → IP_HARD (register access)
    sb->ip_hard_socket .bind(ip->soft_socket);

    // 4. IP_HARD → BRAM (pixel DMA)
    ip->bram_socket    .bind(ram->ip_socket);

    SC_REPORT_INFO("VP", "Platform constructed and connected.");
}

vp::~vp()
{
    SC_REPORT_INFO("VP", "Destroyed.");
    delete sb; delete ip; delete ram; delete cpu;
}
