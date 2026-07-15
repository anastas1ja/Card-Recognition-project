############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project card_recognizer_dram_hls
set_top card_recognizer_hw
add_files hls_fajlovi/card_recognizer_dram_hls.cpp
add_files -tb testbench.cpp -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z010i-clg225-1L}
create_clock -period 10ns -name default
config_export -format ip_catalog
source "./card_recognizer_dram_hls/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -format ip_catalog
