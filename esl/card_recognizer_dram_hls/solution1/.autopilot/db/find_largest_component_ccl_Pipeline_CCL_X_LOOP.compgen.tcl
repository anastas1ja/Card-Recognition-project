# This script segment is generated automatically by AutoPilot

set id 25
set name card_recognizer_hw_mux_21_8_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 8
set din0_signed 0
set din1_width 8
set din1_signed 0
set din2_width 1
set din2_signed 0
set dout_width 8
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 31 \
    name curr_label_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename curr_label_V \
    op interface \
    ports { curr_label_V_address0 { O 7 vector } curr_label_V_ce0 { O 1 bit } curr_label_V_we0 { O 1 bit } curr_label_V_d0 { O 8 vector } curr_label_V_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'curr_label_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 32 \
    name curr_label_V_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename curr_label_V_1 \
    op interface \
    ports { curr_label_V_1_address0 { O 7 vector } curr_label_V_1_ce0 { O 1 bit } curr_label_V_1_we0 { O 1 bit } curr_label_V_1_d0 { O 8 vector } curr_label_V_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'curr_label_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 33 \
    name prev_label_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prev_label_V \
    op interface \
    ports { prev_label_V_address0 { O 7 vector } prev_label_V_ce0 { O 1 bit } prev_label_V_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prev_label_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name prev_label_V_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename prev_label_V_1 \
    op interface \
    ports { prev_label_V_1_address0 { O 7 vector } prev_label_V_1_ce0 { O 1 bit } prev_label_V_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'prev_label_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name parent_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename parent_V \
    op interface \
    ports { parent_V_address0 { O 8 vector } parent_V_ce0 { O 1 bit } parent_V_we0 { O 1 bit } parent_V_d0 { O 8 vector } parent_V_q0 { I 8 vector } parent_V_address1 { O 8 vector } parent_V_ce1 { O 1 bit } parent_V_we1 { O 1 bit } parent_V_d1 { O 8 vector } parent_V_q1 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'parent_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 36 \
    name count \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename count \
    op interface \
    ports { count_address0 { O 8 vector } count_ce0 { O 1 bit } count_we0 { O 1 bit } count_d0 { O 32 vector } count_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'count'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 37 \
    name max_y_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename max_y_V \
    op interface \
    ports { max_y_V_address0 { O 8 vector } max_y_V_ce0 { O 1 bit } max_y_V_we0 { O 1 bit } max_y_V_d0 { O 8 vector } max_y_V_q0 { I 8 vector } max_y_V_address1 { O 8 vector } max_y_V_ce1 { O 1 bit } max_y_V_we1 { O 1 bit } max_y_V_d1 { O 8 vector } max_y_V_q1 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'max_y_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name max_x_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename max_x_V \
    op interface \
    ports { max_x_V_address0 { O 8 vector } max_x_V_ce0 { O 1 bit } max_x_V_we0 { O 1 bit } max_x_V_d0 { O 8 vector } max_x_V_q0 { I 8 vector } max_x_V_address1 { O 8 vector } max_x_V_ce1 { O 1 bit } max_x_V_we1 { O 1 bit } max_x_V_d1 { O 8 vector } max_x_V_q1 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'max_x_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 39 \
    name min_y_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename min_y_V \
    op interface \
    ports { min_y_V_address0 { O 8 vector } min_y_V_ce0 { O 1 bit } min_y_V_we0 { O 1 bit } min_y_V_d0 { O 8 vector } min_y_V_q0 { I 8 vector } min_y_V_address1 { O 8 vector } min_y_V_ce1 { O 1 bit } min_y_V_we1 { O 1 bit } min_y_V_d1 { O 8 vector } min_y_V_q1 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'min_y_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 40 \
    name min_x_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename min_x_V \
    op interface \
    ports { min_x_V_address0 { O 8 vector } min_x_V_ce0 { O 1 bit } min_x_V_we0 { O 1 bit } min_x_V_d0 { O 8 vector } min_x_V_q0 { I 8 vector } min_x_V_address1 { O 8 vector } min_x_V_ce1 { O 1 bit } min_x_V_we1 { O 1 bit } min_x_V_d1 { O 8 vector } min_x_V_q1 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'min_x_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 43 \
    name binary_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename binary_V \
    op interface \
    ports { binary_V_address0 { O 15 vector } binary_V_ce0 { O 1 bit } binary_V_q0 { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'binary_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name next_label \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_next_label \
    op interface \
    ports { next_label { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name width \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_width \
    op interface \
    ports { width { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 15 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name cy_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cy_V \
    op interface \
    ports { cy_V { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name next_label_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_next_label_1_out \
    op interface \
    ports { next_label_1_out { O 32 vector } next_label_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName card_recognizer_hw_flow_control_loop_pipe_sequential_init_U
set CompName card_recognizer_hw_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix card_recognizer_hw_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


