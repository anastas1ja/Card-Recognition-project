set moduleName find_largest_component_ccl_Pipeline_CCL_X_LOOP
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {find_largest_component_ccl_Pipeline_CCL_X_LOOP}
set C_modelType { void 0 }
set C_modelArgList {
	{ next_label int 32 regular  }
	{ width int 32 regular  }
	{ empty int 15 regular  }
	{ curr_label_V int 8 regular {array 80 { 2 3 } 1 1 }  }
	{ curr_label_V_1 int 8 regular {array 80 { 2 3 } 1 1 }  }
	{ prev_label_V int 8 regular {array 80 { 1 3 } 1 1 }  }
	{ prev_label_V_1 int 8 regular {array 80 { 1 3 } 1 1 }  }
	{ parent_V int 8 regular {array 256 { 2 2 } 1 1 }  }
	{ count int 32 regular {array 256 { 2 3 } 1 1 }  }
	{ max_y_V int 8 regular {array 256 { 2 2 } 1 1 }  }
	{ max_x_V int 8 regular {array 256 { 2 2 } 1 1 }  }
	{ min_y_V int 8 regular {array 256 { 2 2 } 1 1 }  }
	{ min_x_V int 8 regular {array 256 { 2 2 } 1 1 }  }
	{ cy_V int 8 regular  }
	{ next_label_1_out int 32 regular {pointer 1}  }
	{ binary_V int 1 regular {array 19200 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "next_label", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "curr_label_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "curr_label_V_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "prev_label_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "prev_label_V_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "parent_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "count", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "max_y_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "max_x_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "min_y_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "min_x_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE"} , 
 	{ "Name" : "cy_V", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "next_label_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "binary_V", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 86
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ next_label sc_in sc_lv 32 signal 0 } 
	{ width sc_in sc_lv 32 signal 1 } 
	{ empty sc_in sc_lv 15 signal 2 } 
	{ curr_label_V_address0 sc_out sc_lv 7 signal 3 } 
	{ curr_label_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ curr_label_V_we0 sc_out sc_logic 1 signal 3 } 
	{ curr_label_V_d0 sc_out sc_lv 8 signal 3 } 
	{ curr_label_V_q0 sc_in sc_lv 8 signal 3 } 
	{ curr_label_V_1_address0 sc_out sc_lv 7 signal 4 } 
	{ curr_label_V_1_ce0 sc_out sc_logic 1 signal 4 } 
	{ curr_label_V_1_we0 sc_out sc_logic 1 signal 4 } 
	{ curr_label_V_1_d0 sc_out sc_lv 8 signal 4 } 
	{ curr_label_V_1_q0 sc_in sc_lv 8 signal 4 } 
	{ prev_label_V_address0 sc_out sc_lv 7 signal 5 } 
	{ prev_label_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ prev_label_V_q0 sc_in sc_lv 8 signal 5 } 
	{ prev_label_V_1_address0 sc_out sc_lv 7 signal 6 } 
	{ prev_label_V_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ prev_label_V_1_q0 sc_in sc_lv 8 signal 6 } 
	{ parent_V_address0 sc_out sc_lv 8 signal 7 } 
	{ parent_V_ce0 sc_out sc_logic 1 signal 7 } 
	{ parent_V_we0 sc_out sc_logic 1 signal 7 } 
	{ parent_V_d0 sc_out sc_lv 8 signal 7 } 
	{ parent_V_q0 sc_in sc_lv 8 signal 7 } 
	{ parent_V_address1 sc_out sc_lv 8 signal 7 } 
	{ parent_V_ce1 sc_out sc_logic 1 signal 7 } 
	{ parent_V_we1 sc_out sc_logic 1 signal 7 } 
	{ parent_V_d1 sc_out sc_lv 8 signal 7 } 
	{ parent_V_q1 sc_in sc_lv 8 signal 7 } 
	{ count_address0 sc_out sc_lv 8 signal 8 } 
	{ count_ce0 sc_out sc_logic 1 signal 8 } 
	{ count_we0 sc_out sc_logic 1 signal 8 } 
	{ count_d0 sc_out sc_lv 32 signal 8 } 
	{ count_q0 sc_in sc_lv 32 signal 8 } 
	{ max_y_V_address0 sc_out sc_lv 8 signal 9 } 
	{ max_y_V_ce0 sc_out sc_logic 1 signal 9 } 
	{ max_y_V_we0 sc_out sc_logic 1 signal 9 } 
	{ max_y_V_d0 sc_out sc_lv 8 signal 9 } 
	{ max_y_V_q0 sc_in sc_lv 8 signal 9 } 
	{ max_y_V_address1 sc_out sc_lv 8 signal 9 } 
	{ max_y_V_ce1 sc_out sc_logic 1 signal 9 } 
	{ max_y_V_we1 sc_out sc_logic 1 signal 9 } 
	{ max_y_V_d1 sc_out sc_lv 8 signal 9 } 
	{ max_y_V_q1 sc_in sc_lv 8 signal 9 } 
	{ max_x_V_address0 sc_out sc_lv 8 signal 10 } 
	{ max_x_V_ce0 sc_out sc_logic 1 signal 10 } 
	{ max_x_V_we0 sc_out sc_logic 1 signal 10 } 
	{ max_x_V_d0 sc_out sc_lv 8 signal 10 } 
	{ max_x_V_q0 sc_in sc_lv 8 signal 10 } 
	{ max_x_V_address1 sc_out sc_lv 8 signal 10 } 
	{ max_x_V_ce1 sc_out sc_logic 1 signal 10 } 
	{ max_x_V_we1 sc_out sc_logic 1 signal 10 } 
	{ max_x_V_d1 sc_out sc_lv 8 signal 10 } 
	{ max_x_V_q1 sc_in sc_lv 8 signal 10 } 
	{ min_y_V_address0 sc_out sc_lv 8 signal 11 } 
	{ min_y_V_ce0 sc_out sc_logic 1 signal 11 } 
	{ min_y_V_we0 sc_out sc_logic 1 signal 11 } 
	{ min_y_V_d0 sc_out sc_lv 8 signal 11 } 
	{ min_y_V_q0 sc_in sc_lv 8 signal 11 } 
	{ min_y_V_address1 sc_out sc_lv 8 signal 11 } 
	{ min_y_V_ce1 sc_out sc_logic 1 signal 11 } 
	{ min_y_V_we1 sc_out sc_logic 1 signal 11 } 
	{ min_y_V_d1 sc_out sc_lv 8 signal 11 } 
	{ min_y_V_q1 sc_in sc_lv 8 signal 11 } 
	{ min_x_V_address0 sc_out sc_lv 8 signal 12 } 
	{ min_x_V_ce0 sc_out sc_logic 1 signal 12 } 
	{ min_x_V_we0 sc_out sc_logic 1 signal 12 } 
	{ min_x_V_d0 sc_out sc_lv 8 signal 12 } 
	{ min_x_V_q0 sc_in sc_lv 8 signal 12 } 
	{ min_x_V_address1 sc_out sc_lv 8 signal 12 } 
	{ min_x_V_ce1 sc_out sc_logic 1 signal 12 } 
	{ min_x_V_we1 sc_out sc_logic 1 signal 12 } 
	{ min_x_V_d1 sc_out sc_lv 8 signal 12 } 
	{ min_x_V_q1 sc_in sc_lv 8 signal 12 } 
	{ cy_V sc_in sc_lv 8 signal 13 } 
	{ next_label_1_out sc_out sc_lv 32 signal 14 } 
	{ next_label_1_out_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ binary_V_address0 sc_out sc_lv 15 signal 15 } 
	{ binary_V_ce0 sc_out sc_logic 1 signal 15 } 
	{ binary_V_q0 sc_in sc_lv 1 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "next_label", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "next_label", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "curr_label_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "curr_label_V", "role": "address0" }} , 
 	{ "name": "curr_label_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curr_label_V", "role": "ce0" }} , 
 	{ "name": "curr_label_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curr_label_V", "role": "we0" }} , 
 	{ "name": "curr_label_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curr_label_V", "role": "d0" }} , 
 	{ "name": "curr_label_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curr_label_V", "role": "q0" }} , 
 	{ "name": "curr_label_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "curr_label_V_1", "role": "address0" }} , 
 	{ "name": "curr_label_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curr_label_V_1", "role": "ce0" }} , 
 	{ "name": "curr_label_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "curr_label_V_1", "role": "we0" }} , 
 	{ "name": "curr_label_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curr_label_V_1", "role": "d0" }} , 
 	{ "name": "curr_label_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "curr_label_V_1", "role": "q0" }} , 
 	{ "name": "prev_label_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "prev_label_V", "role": "address0" }} , 
 	{ "name": "prev_label_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prev_label_V", "role": "ce0" }} , 
 	{ "name": "prev_label_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "prev_label_V", "role": "q0" }} , 
 	{ "name": "prev_label_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "prev_label_V_1", "role": "address0" }} , 
 	{ "name": "prev_label_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "prev_label_V_1", "role": "ce0" }} , 
 	{ "name": "prev_label_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "prev_label_V_1", "role": "q0" }} , 
 	{ "name": "parent_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "address0" }} , 
 	{ "name": "parent_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent_V", "role": "ce0" }} , 
 	{ "name": "parent_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent_V", "role": "we0" }} , 
 	{ "name": "parent_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "d0" }} , 
 	{ "name": "parent_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "q0" }} , 
 	{ "name": "parent_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "address1" }} , 
 	{ "name": "parent_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent_V", "role": "ce1" }} , 
 	{ "name": "parent_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent_V", "role": "we1" }} , 
 	{ "name": "parent_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "d1" }} , 
 	{ "name": "parent_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "q1" }} , 
 	{ "name": "count_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "count", "role": "address0" }} , 
 	{ "name": "count_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "count", "role": "ce0" }} , 
 	{ "name": "count_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "count", "role": "we0" }} , 
 	{ "name": "count_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "count", "role": "d0" }} , 
 	{ "name": "count_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "count", "role": "q0" }} , 
 	{ "name": "max_y_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "address0" }} , 
 	{ "name": "max_y_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y_V", "role": "ce0" }} , 
 	{ "name": "max_y_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y_V", "role": "we0" }} , 
 	{ "name": "max_y_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "d0" }} , 
 	{ "name": "max_y_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "q0" }} , 
 	{ "name": "max_y_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "address1" }} , 
 	{ "name": "max_y_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y_V", "role": "ce1" }} , 
 	{ "name": "max_y_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y_V", "role": "we1" }} , 
 	{ "name": "max_y_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "d1" }} , 
 	{ "name": "max_y_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "q1" }} , 
 	{ "name": "max_x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "address0" }} , 
 	{ "name": "max_x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x_V", "role": "ce0" }} , 
 	{ "name": "max_x_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x_V", "role": "we0" }} , 
 	{ "name": "max_x_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "d0" }} , 
 	{ "name": "max_x_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "q0" }} , 
 	{ "name": "max_x_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "address1" }} , 
 	{ "name": "max_x_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x_V", "role": "ce1" }} , 
 	{ "name": "max_x_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x_V", "role": "we1" }} , 
 	{ "name": "max_x_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "d1" }} , 
 	{ "name": "max_x_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "q1" }} , 
 	{ "name": "min_y_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "address0" }} , 
 	{ "name": "min_y_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y_V", "role": "ce0" }} , 
 	{ "name": "min_y_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y_V", "role": "we0" }} , 
 	{ "name": "min_y_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "d0" }} , 
 	{ "name": "min_y_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "q0" }} , 
 	{ "name": "min_y_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "address1" }} , 
 	{ "name": "min_y_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y_V", "role": "ce1" }} , 
 	{ "name": "min_y_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y_V", "role": "we1" }} , 
 	{ "name": "min_y_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "d1" }} , 
 	{ "name": "min_y_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "q1" }} , 
 	{ "name": "min_x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "address0" }} , 
 	{ "name": "min_x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x_V", "role": "ce0" }} , 
 	{ "name": "min_x_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x_V", "role": "we0" }} , 
 	{ "name": "min_x_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "d0" }} , 
 	{ "name": "min_x_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "q0" }} , 
 	{ "name": "min_x_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "address1" }} , 
 	{ "name": "min_x_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x_V", "role": "ce1" }} , 
 	{ "name": "min_x_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x_V", "role": "we1" }} , 
 	{ "name": "min_x_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "d1" }} , 
 	{ "name": "min_x_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "q1" }} , 
 	{ "name": "cy_V", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "cy_V", "role": "default" }} , 
 	{ "name": "next_label_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "next_label_1_out", "role": "default" }} , 
 	{ "name": "next_label_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "next_label_1_out", "role": "ap_vld" }} , 
 	{ "name": "binary_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "binary_V", "role": "address0" }} , 
 	{ "name": "binary_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "binary_V", "role": "ce0" }} , 
 	{ "name": "binary_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "binary_V", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "find_largest_component_ccl_Pipeline_CCL_X_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1929", "EstimateLatencyMax" : "1929",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "next_label", "Type" : "None", "Direction" : "I"},
			{"Name" : "width", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "curr_label_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "curr_label_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "prev_label_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "prev_label_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "parent_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "count", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "max_y_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "max_x_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "min_y_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "min_x_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "cy_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "next_label_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "binary_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "CCL_X_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage7", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage7_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_8_1_1_U25", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_21_8_1_1_U26", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	find_largest_component_ccl_Pipeline_CCL_X_LOOP {
		next_label {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		curr_label_V {Type IO LastRead 1 FirstWrite 12}
		curr_label_V_1 {Type IO LastRead 1 FirstWrite 12}
		prev_label_V {Type I LastRead 1 FirstWrite -1}
		prev_label_V_1 {Type I LastRead 1 FirstWrite -1}
		parent_V {Type IO LastRead 11 FirstWrite 8}
		count {Type IO LastRead 12 FirstWrite 9}
		max_y_V {Type IO LastRead 12 FirstWrite 9}
		max_x_V {Type IO LastRead 12 FirstWrite 9}
		min_y_V {Type IO LastRead 12 FirstWrite 9}
		min_x_V {Type IO LastRead 12 FirstWrite 9}
		cy_V {Type I LastRead 0 FirstWrite -1}
		next_label_1_out {Type O LastRead -1 FirstWrite 7}
		binary_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1929", "Max" : "1929"}
	, {"Name" : "Interval", "Min" : "1929", "Max" : "1929"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	next_label { ap_none {  { next_label in_data 0 32 } } }
	width { ap_none {  { width in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 15 } } }
	curr_label_V { ap_memory {  { curr_label_V_address0 mem_address 1 7 }  { curr_label_V_ce0 mem_ce 1 1 }  { curr_label_V_we0 mem_we 1 1 }  { curr_label_V_d0 mem_din 1 8 }  { curr_label_V_q0 in_data 0 8 } } }
	curr_label_V_1 { ap_memory {  { curr_label_V_1_address0 mem_address 1 7 }  { curr_label_V_1_ce0 mem_ce 1 1 }  { curr_label_V_1_we0 mem_we 1 1 }  { curr_label_V_1_d0 mem_din 1 8 }  { curr_label_V_1_q0 in_data 0 8 } } }
	prev_label_V { ap_memory {  { prev_label_V_address0 mem_address 1 7 }  { prev_label_V_ce0 mem_ce 1 1 }  { prev_label_V_q0 in_data 0 8 } } }
	prev_label_V_1 { ap_memory {  { prev_label_V_1_address0 mem_address 1 7 }  { prev_label_V_1_ce0 mem_ce 1 1 }  { prev_label_V_1_q0 in_data 0 8 } } }
	parent_V { ap_memory {  { parent_V_address0 mem_address 1 8 }  { parent_V_ce0 mem_ce 1 1 }  { parent_V_we0 mem_we 1 1 }  { parent_V_d0 mem_din 1 8 }  { parent_V_q0 in_data 0 8 }  { parent_V_address1 MemPortADDR2 1 8 }  { parent_V_ce1 MemPortCE2 1 1 }  { parent_V_we1 MemPortWE2 1 1 }  { parent_V_d1 MemPortDIN2 1 8 }  { parent_V_q1 in_data 0 8 } } }
	count { ap_memory {  { count_address0 mem_address 1 8 }  { count_ce0 mem_ce 1 1 }  { count_we0 mem_we 1 1 }  { count_d0 mem_din 1 32 }  { count_q0 in_data 0 32 } } }
	max_y_V { ap_memory {  { max_y_V_address0 mem_address 1 8 }  { max_y_V_ce0 mem_ce 1 1 }  { max_y_V_we0 mem_we 1 1 }  { max_y_V_d0 mem_din 1 8 }  { max_y_V_q0 in_data 0 8 }  { max_y_V_address1 MemPortADDR2 1 8 }  { max_y_V_ce1 MemPortCE2 1 1 }  { max_y_V_we1 MemPortWE2 1 1 }  { max_y_V_d1 MemPortDIN2 1 8 }  { max_y_V_q1 in_data 0 8 } } }
	max_x_V { ap_memory {  { max_x_V_address0 mem_address 1 8 }  { max_x_V_ce0 mem_ce 1 1 }  { max_x_V_we0 mem_we 1 1 }  { max_x_V_d0 mem_din 1 8 }  { max_x_V_q0 in_data 0 8 }  { max_x_V_address1 MemPortADDR2 1 8 }  { max_x_V_ce1 MemPortCE2 1 1 }  { max_x_V_we1 MemPortWE2 1 1 }  { max_x_V_d1 MemPortDIN2 1 8 }  { max_x_V_q1 in_data 0 8 } } }
	min_y_V { ap_memory {  { min_y_V_address0 mem_address 1 8 }  { min_y_V_ce0 mem_ce 1 1 }  { min_y_V_we0 mem_we 1 1 }  { min_y_V_d0 mem_din 1 8 }  { min_y_V_q0 in_data 0 8 }  { min_y_V_address1 MemPortADDR2 1 8 }  { min_y_V_ce1 MemPortCE2 1 1 }  { min_y_V_we1 MemPortWE2 1 1 }  { min_y_V_d1 MemPortDIN2 1 8 }  { min_y_V_q1 in_data 0 8 } } }
	min_x_V { ap_memory {  { min_x_V_address0 mem_address 1 8 }  { min_x_V_ce0 mem_ce 1 1 }  { min_x_V_we0 mem_we 1 1 }  { min_x_V_d0 mem_din 1 8 }  { min_x_V_q0 in_data 0 8 }  { min_x_V_address1 MemPortADDR2 1 8 }  { min_x_V_ce1 MemPortCE2 1 1 }  { min_x_V_we1 MemPortWE2 1 1 }  { min_x_V_d1 MemPortDIN2 1 8 }  { min_x_V_q1 in_data 0 8 } } }
	cy_V { ap_none {  { cy_V in_data 0 8 } } }
	next_label_1_out { ap_vld {  { next_label_1_out out_data 1 32 }  { next_label_1_out_ap_vld out_vld 1 1 } } }
	binary_V { ap_memory {  { binary_V_address0 mem_address 1 15 }  { binary_V_ce0 mem_ce 1 1 }  { binary_V_q0 in_data 0 1 } } }
}
