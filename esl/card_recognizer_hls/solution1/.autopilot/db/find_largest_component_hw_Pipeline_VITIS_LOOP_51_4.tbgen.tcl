set moduleName find_largest_component_hw_Pipeline_VITIS_LOOP_51_4
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
set C_modelName {find_largest_component_hw_Pipeline_VITIS_LOOP_51_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ height int 32 regular  }
	{ width int 32 regular  }
	{ best_count_3_out int 32 regular {pointer 1}  }
	{ queue_x float 32 regular {array 307200 { 2 3 } 1 1 } {global 2}  }
	{ queue_y float 32 regular {array 307200 { 2 3 } 1 1 } {global 2}  }
	{ binary int 2 regular {array 307200 { 1 1 } 1 1 } {global 0}  }
	{ visited int 1 regular {array 307200 { 2 2 } 1 1 } {global 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "height", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "width", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "best_count_3_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "queue_x", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "queue_y", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "binary", "interface" : "memory", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "visited", "interface" : "memory", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ height sc_in sc_lv 32 signal 0 } 
	{ width sc_in sc_lv 32 signal 1 } 
	{ best_count_3_out sc_out sc_lv 32 signal 2 } 
	{ best_count_3_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ queue_x_address0 sc_out sc_lv 19 signal 3 } 
	{ queue_x_ce0 sc_out sc_logic 1 signal 3 } 
	{ queue_x_we0 sc_out sc_logic 1 signal 3 } 
	{ queue_x_d0 sc_out sc_lv 32 signal 3 } 
	{ queue_x_q0 sc_in sc_lv 32 signal 3 } 
	{ queue_y_address0 sc_out sc_lv 19 signal 4 } 
	{ queue_y_ce0 sc_out sc_logic 1 signal 4 } 
	{ queue_y_we0 sc_out sc_logic 1 signal 4 } 
	{ queue_y_d0 sc_out sc_lv 32 signal 4 } 
	{ queue_y_q0 sc_in sc_lv 32 signal 4 } 
	{ binary_address0 sc_out sc_lv 19 signal 5 } 
	{ binary_ce0 sc_out sc_logic 1 signal 5 } 
	{ binary_q0 sc_in sc_lv 2 signal 5 } 
	{ binary_address1 sc_out sc_lv 19 signal 5 } 
	{ binary_ce1 sc_out sc_logic 1 signal 5 } 
	{ binary_q1 sc_in sc_lv 2 signal 5 } 
	{ visited_address0 sc_out sc_lv 19 signal 6 } 
	{ visited_ce0 sc_out sc_logic 1 signal 6 } 
	{ visited_we0 sc_out sc_logic 1 signal 6 } 
	{ visited_d0 sc_out sc_lv 1 signal 6 } 
	{ visited_q0 sc_in sc_lv 1 signal 6 } 
	{ visited_address1 sc_out sc_lv 19 signal 6 } 
	{ visited_ce1 sc_out sc_logic 1 signal 6 } 
	{ visited_we1 sc_out sc_logic 1 signal 6 } 
	{ visited_d1 sc_out sc_lv 1 signal 6 } 
	{ visited_q1 sc_in sc_lv 1 signal 6 } 
	{ grp_fu_149_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_149_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_149_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_149_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "height", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "height", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "best_count_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "best_count_3_out", "role": "default" }} , 
 	{ "name": "best_count_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "best_count_3_out", "role": "ap_vld" }} , 
 	{ "name": "queue_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "queue_x", "role": "address0" }} , 
 	{ "name": "queue_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "queue_x", "role": "ce0" }} , 
 	{ "name": "queue_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "queue_x", "role": "we0" }} , 
 	{ "name": "queue_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "queue_x", "role": "d0" }} , 
 	{ "name": "queue_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "queue_x", "role": "q0" }} , 
 	{ "name": "queue_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "queue_y", "role": "address0" }} , 
 	{ "name": "queue_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "queue_y", "role": "ce0" }} , 
 	{ "name": "queue_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "queue_y", "role": "we0" }} , 
 	{ "name": "queue_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "queue_y", "role": "d0" }} , 
 	{ "name": "queue_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "queue_y", "role": "q0" }} , 
 	{ "name": "binary_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "binary", "role": "address0" }} , 
 	{ "name": "binary_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "binary", "role": "ce0" }} , 
 	{ "name": "binary_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "binary", "role": "q0" }} , 
 	{ "name": "binary_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "binary", "role": "address1" }} , 
 	{ "name": "binary_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "binary", "role": "ce1" }} , 
 	{ "name": "binary_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "binary", "role": "q1" }} , 
 	{ "name": "visited_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "visited", "role": "address0" }} , 
 	{ "name": "visited_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "ce0" }} , 
 	{ "name": "visited_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "we0" }} , 
 	{ "name": "visited_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "d0" }} , 
 	{ "name": "visited_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "q0" }} , 
 	{ "name": "visited_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "visited", "role": "address1" }} , 
 	{ "name": "visited_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "ce1" }} , 
 	{ "name": "visited_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "we1" }} , 
 	{ "name": "visited_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "d1" }} , 
 	{ "name": "visited_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "visited", "role": "q1" }} , 
 	{ "name": "grp_fu_149_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_149_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_149_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_149_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_149_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_149_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_149_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_149_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "find_largest_component_hw_Pipeline_VITIS_LOOP_51_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "height", "Type" : "None", "Direction" : "I"},
			{"Name" : "width", "Type" : "None", "Direction" : "I"},
			{"Name" : "best_count_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "queue_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "queue_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "binary", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "visited", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_51_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_6_no_dsp_1_U16", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32s_32_6_no_dsp_1_U17", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_1_1_U18", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_1_1_U19", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U21", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	find_largest_component_hw_Pipeline_VITIS_LOOP_51_4 {
		height {Type I LastRead 0 FirstWrite -1}
		width {Type I LastRead 0 FirstWrite -1}
		best_count_3_out {Type O LastRead -1 FirstWrite 1}
		queue_x {Type IO LastRead 1 FirstWrite 9}
		queue_y {Type IO LastRead 1 FirstWrite 9}
		binary {Type I LastRead 5 FirstWrite -1}
		visited {Type IO LastRead 7 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	height { ap_none {  { height in_data 0 32 } } }
	width { ap_none {  { width in_data 0 32 } } }
	best_count_3_out { ap_vld {  { best_count_3_out out_data 1 32 }  { best_count_3_out_ap_vld out_vld 1 1 } } }
	queue_x { ap_memory {  { queue_x_address0 mem_address 1 19 }  { queue_x_ce0 mem_ce 1 1 }  { queue_x_we0 mem_we 1 1 }  { queue_x_d0 mem_din 1 32 }  { queue_x_q0 in_data 0 32 } } }
	queue_y { ap_memory {  { queue_y_address0 mem_address 1 19 }  { queue_y_ce0 mem_ce 1 1 }  { queue_y_we0 mem_we 1 1 }  { queue_y_d0 mem_din 1 32 }  { queue_y_q0 in_data 0 32 } } }
	binary { ap_memory {  { binary_address0 mem_address 1 19 }  { binary_ce0 mem_ce 1 1 }  { binary_q0 in_data 0 2 }  { binary_address1 MemPortADDR2 1 19 }  { binary_ce1 MemPortCE2 1 1 }  { binary_q1 in_data 0 2 } } }
	visited { ap_memory {  { visited_address0 mem_address 1 19 }  { visited_ce0 mem_ce 1 1 }  { visited_we0 mem_we 1 1 }  { visited_d0 mem_din 1 1 }  { visited_q0 in_data 0 1 }  { visited_address1 MemPortADDR2 1 19 }  { visited_ce1 MemPortCE2 1 1 }  { visited_we1 MemPortWE2 1 1 }  { visited_d1 MemPortDIN2 1 1 }  { visited_q1 in_data 0 1 } } }
}
