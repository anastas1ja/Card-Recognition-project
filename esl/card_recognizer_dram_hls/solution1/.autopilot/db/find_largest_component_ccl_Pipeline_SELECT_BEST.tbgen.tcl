set moduleName find_largest_component_ccl_Pipeline_SELECT_BEST
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
set C_modelName {find_largest_component_ccl_Pipeline_SELECT_BEST}
set C_modelType { void 0 }
set C_modelArgList {
	{ parent_V int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ count int 32 regular {array 256 { 1 3 } 1 1 }  }
	{ min_x_V int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ min_y_V int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ max_x_V int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ max_y_V int 8 regular {array 256 { 1 3 } 1 1 }  }
	{ p_out int 32 regular {pointer 1}  }
	{ p_0_0_0317415_out int 8 regular {pointer 1}  }
	{ p_0_0_0316614_out int 8 regular {pointer 1}  }
	{ p_0_0_0315813_out int 8 regular {pointer 1}  }
	{ p_0_0_03141012_out int 8 regular {pointer 1}  }
	{ p_out1 int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "parent_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "count", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "min_x_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "min_y_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "max_x_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "max_y_V", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0317415_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0316614_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0315813_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_03141012_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out1", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 36
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ parent_V_address0 sc_out sc_lv 8 signal 0 } 
	{ parent_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ parent_V_q0 sc_in sc_lv 8 signal 0 } 
	{ count_address0 sc_out sc_lv 8 signal 1 } 
	{ count_ce0 sc_out sc_logic 1 signal 1 } 
	{ count_q0 sc_in sc_lv 32 signal 1 } 
	{ min_x_V_address0 sc_out sc_lv 8 signal 2 } 
	{ min_x_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ min_x_V_q0 sc_in sc_lv 8 signal 2 } 
	{ min_y_V_address0 sc_out sc_lv 8 signal 3 } 
	{ min_y_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ min_y_V_q0 sc_in sc_lv 8 signal 3 } 
	{ max_x_V_address0 sc_out sc_lv 8 signal 4 } 
	{ max_x_V_ce0 sc_out sc_logic 1 signal 4 } 
	{ max_x_V_q0 sc_in sc_lv 8 signal 4 } 
	{ max_y_V_address0 sc_out sc_lv 8 signal 5 } 
	{ max_y_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ max_y_V_q0 sc_in sc_lv 8 signal 5 } 
	{ p_out sc_out sc_lv 32 signal 6 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ p_0_0_0317415_out sc_out sc_lv 8 signal 7 } 
	{ p_0_0_0317415_out_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ p_0_0_0316614_out sc_out sc_lv 8 signal 8 } 
	{ p_0_0_0316614_out_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ p_0_0_0315813_out sc_out sc_lv 8 signal 9 } 
	{ p_0_0_0315813_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ p_0_0_03141012_out sc_out sc_lv 8 signal 10 } 
	{ p_0_0_03141012_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ p_out1 sc_out sc_lv 1 signal 11 } 
	{ p_out1_ap_vld sc_out sc_logic 1 outvld 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "parent_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "address0" }} , 
 	{ "name": "parent_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent_V", "role": "ce0" }} , 
 	{ "name": "parent_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "parent_V", "role": "q0" }} , 
 	{ "name": "count_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "count", "role": "address0" }} , 
 	{ "name": "count_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "count", "role": "ce0" }} , 
 	{ "name": "count_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "count", "role": "q0" }} , 
 	{ "name": "min_x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "address0" }} , 
 	{ "name": "min_x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x_V", "role": "ce0" }} , 
 	{ "name": "min_x_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_x_V", "role": "q0" }} , 
 	{ "name": "min_y_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "address0" }} , 
 	{ "name": "min_y_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y_V", "role": "ce0" }} , 
 	{ "name": "min_y_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y_V", "role": "q0" }} , 
 	{ "name": "max_x_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "address0" }} , 
 	{ "name": "max_x_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x_V", "role": "ce0" }} , 
 	{ "name": "max_x_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_x_V", "role": "q0" }} , 
 	{ "name": "max_y_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "address0" }} , 
 	{ "name": "max_y_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y_V", "role": "ce0" }} , 
 	{ "name": "max_y_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y_V", "role": "q0" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0317415_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0317415_out", "role": "default" }} , 
 	{ "name": "p_0_0_0317415_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0317415_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0316614_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0316614_out", "role": "default" }} , 
 	{ "name": "p_0_0_0316614_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0316614_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0315813_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0315813_out", "role": "default" }} , 
 	{ "name": "p_0_0_0315813_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0315813_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_03141012_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_03141012_out", "role": "default" }} , 
 	{ "name": "p_0_0_03141012_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_03141012_out", "role": "ap_vld" }} , 
 	{ "name": "p_out1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_out1", "role": "default" }} , 
 	{ "name": "p_out1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out1", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "find_largest_component_ccl_Pipeline_SELECT_BEST",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "258", "EstimateLatencyMax" : "258",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "parent_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "count", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_x_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_y_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_x_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_y_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_0_0_0317415_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_0_0_0316614_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_0_0_0315813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_0_0_03141012_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "SELECT_BEST", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	find_largest_component_ccl_Pipeline_SELECT_BEST {
		parent_V {Type I LastRead 0 FirstWrite -1}
		count {Type I LastRead 0 FirstWrite -1}
		min_x_V {Type I LastRead 1 FirstWrite -1}
		min_y_V {Type I LastRead 1 FirstWrite -1}
		max_x_V {Type I LastRead 1 FirstWrite -1}
		max_y_V {Type I LastRead 1 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_0317415_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_0316614_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_0315813_out {Type O LastRead -1 FirstWrite 1}
		p_0_0_03141012_out {Type O LastRead -1 FirstWrite 1}
		p_out1 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "258", "Max" : "258"}
	, {"Name" : "Interval", "Min" : "258", "Max" : "258"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	parent_V { ap_memory {  { parent_V_address0 mem_address 1 8 }  { parent_V_ce0 mem_ce 1 1 }  { parent_V_q0 in_data 0 8 } } }
	count { ap_memory {  { count_address0 mem_address 1 8 }  { count_ce0 mem_ce 1 1 }  { count_q0 mem_dout 0 32 } } }
	min_x_V { ap_memory {  { min_x_V_address0 mem_address 1 8 }  { min_x_V_ce0 mem_ce 1 1 }  { min_x_V_q0 in_data 0 8 } } }
	min_y_V { ap_memory {  { min_y_V_address0 mem_address 1 8 }  { min_y_V_ce0 mem_ce 1 1 }  { min_y_V_q0 in_data 0 8 } } }
	max_x_V { ap_memory {  { max_x_V_address0 mem_address 1 8 }  { max_x_V_ce0 mem_ce 1 1 }  { max_x_V_q0 in_data 0 8 } } }
	max_y_V { ap_memory {  { max_y_V_address0 mem_address 1 8 }  { max_y_V_ce0 mem_ce 1 1 }  { max_y_V_q0 in_data 0 8 } } }
	p_out { ap_vld {  { p_out out_data 1 32 }  { p_out_ap_vld out_vld 1 1 } } }
	p_0_0_0317415_out { ap_vld {  { p_0_0_0317415_out out_data 1 8 }  { p_0_0_0317415_out_ap_vld out_vld 1 1 } } }
	p_0_0_0316614_out { ap_vld {  { p_0_0_0316614_out out_data 1 8 }  { p_0_0_0316614_out_ap_vld out_vld 1 1 } } }
	p_0_0_0315813_out { ap_vld {  { p_0_0_0315813_out out_data 1 8 }  { p_0_0_0315813_out_ap_vld out_vld 1 1 } } }
	p_0_0_03141012_out { ap_vld {  { p_0_0_03141012_out out_data 1 8 }  { p_0_0_03141012_out_ap_vld out_vld 1 1 } } }
	p_out1 { ap_vld {  { p_out1 out_data 1 1 }  { p_out1_ap_vld out_vld 1 1 } } }
}
