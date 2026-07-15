set moduleName card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP
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
set C_modelName {card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP}
set C_modelType { void 0 }
set C_modelArgList {
	{ card_box_min_y_V int 8 regular  }
	{ zext_ln246_1 int 9 regular  }
	{ trunc_ln9 int 15 regular  }
	{ card_box_min_x_V int 8 regular  }
	{ zext_ln246 int 10 regular  }
	{ roi_count_2_out int 32 regular {pointer 1}  }
	{ binary_V int 1 regular {array 19200 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "card_box_min_y_V", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln246_1", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln9", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "card_box_min_x_V", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln246", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "roi_count_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "binary_V", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ card_box_min_y_V sc_in sc_lv 8 signal 0 } 
	{ zext_ln246_1 sc_in sc_lv 9 signal 1 } 
	{ trunc_ln9 sc_in sc_lv 15 signal 2 } 
	{ card_box_min_x_V sc_in sc_lv 8 signal 3 } 
	{ zext_ln246 sc_in sc_lv 10 signal 4 } 
	{ roi_count_2_out sc_out sc_lv 32 signal 5 } 
	{ roi_count_2_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ binary_V_address0 sc_out sc_lv 15 signal 6 } 
	{ binary_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ binary_V_q0 sc_in sc_lv 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "card_box_min_y_V", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "card_box_min_y_V", "role": "default" }} , 
 	{ "name": "zext_ln246_1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln246_1", "role": "default" }} , 
 	{ "name": "trunc_ln9", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "trunc_ln9", "role": "default" }} , 
 	{ "name": "card_box_min_x_V", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "card_box_min_x_V", "role": "default" }} , 
 	{ "name": "zext_ln246", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "zext_ln246", "role": "default" }} , 
 	{ "name": "roi_count_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "roi_count_2_out", "role": "default" }} , 
 	{ "name": "roi_count_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "roi_count_2_out", "role": "ap_vld" }} , 
 	{ "name": "binary_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "binary_V", "role": "address0" }} , 
 	{ "name": "binary_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "binary_V", "role": "ce0" }} , 
 	{ "name": "binary_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "binary_V", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19205", "EstimateLatencyMax" : "19205",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "card_box_min_y_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln246_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln9", "Type" : "None", "Direction" : "I"},
			{"Name" : "card_box_min_x_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln246", "Type" : "None", "Direction" : "I"},
			{"Name" : "roi_count_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "binary_V", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "ROI_Y_LOOP_ROI_X_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_7ns_15s_8ns_15_4_1_U69", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP {
		card_box_min_y_V {Type I LastRead 0 FirstWrite -1}
		zext_ln246_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln9 {Type I LastRead 0 FirstWrite -1}
		card_box_min_x_V {Type I LastRead 0 FirstWrite -1}
		zext_ln246 {Type I LastRead 0 FirstWrite -1}
		roi_count_2_out {Type O LastRead -1 FirstWrite 3}
		binary_V {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "19205", "Max" : "19205"}
	, {"Name" : "Interval", "Min" : "19205", "Max" : "19205"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	card_box_min_y_V { ap_none {  { card_box_min_y_V in_data 0 8 } } }
	zext_ln246_1 { ap_none {  { zext_ln246_1 in_data 0 9 } } }
	trunc_ln9 { ap_none {  { trunc_ln9 in_data 0 15 } } }
	card_box_min_x_V { ap_none {  { card_box_min_x_V in_data 0 8 } } }
	zext_ln246 { ap_none {  { zext_ln246 in_data 0 10 } } }
	roi_count_2_out { ap_vld {  { roi_count_2_out out_data 1 32 }  { roi_count_2_out_ap_vld out_vld 1 1 } } }
	binary_V { ap_memory {  { binary_V_address0 mem_address 1 15 }  { binary_V_ce0 mem_ce 1 1 }  { binary_V_q0 in_data 0 1 } } }
}
