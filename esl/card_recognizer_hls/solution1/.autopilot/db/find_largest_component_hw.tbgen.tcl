set moduleName find_largest_component_hw
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {find_largest_component_hw}
set C_modelType { int 32 }
set C_modelArgList {
	{ width int 32 regular  }
	{ height int 32 regular  }
	{ binary int 2 regular {array 307200 { 1 1 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "width", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "height", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "binary", "interface" : "memory", "bitwidth" : 2, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ width sc_in sc_lv 32 signal 0 } 
	{ height sc_in sc_lv 32 signal 1 } 
	{ binary_address0 sc_out sc_lv 19 signal 2 } 
	{ binary_ce0 sc_out sc_logic 1 signal 2 } 
	{ binary_q0 sc_in sc_lv 2 signal 2 } 
	{ binary_address1 sc_out sc_lv 19 signal 2 } 
	{ binary_ce1 sc_out sc_logic 1 signal 2 } 
	{ binary_q1 sc_in sc_lv 2 signal 2 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
	{ grp_fu_156_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_156_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_156_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_156_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "width", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "width", "role": "default" }} , 
 	{ "name": "height", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "height", "role": "default" }} , 
 	{ "name": "binary_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "binary", "role": "address0" }} , 
 	{ "name": "binary_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "binary", "role": "ce0" }} , 
 	{ "name": "binary_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "binary", "role": "q0" }} , 
 	{ "name": "binary_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "binary", "role": "address1" }} , 
 	{ "name": "binary_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "binary", "role": "ce1" }} , 
 	{ "name": "binary_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "binary", "role": "q1" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "grp_fu_156_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_156_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_156_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_156_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_156_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_156_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_156_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_156_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "6", "13", "14", "15"],
		"CDFG" : "find_largest_component_hw",
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
			{"Name" : "width", "Type" : "None", "Direction" : "I"},
			{"Name" : "height", "Type" : "None", "Direction" : "I"},
			{"Name" : "visited", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122", "Port" : "visited", "Inst_start_state" : "19", "Inst_end_state" : "20"},
					{"ID" : "4", "SubInstance" : "grp_find_largest_component_hw_Pipeline_VITIS_LOOP_31_1_fu_115", "Port" : "visited", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "queue_x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122", "Port" : "queue_x", "Inst_start_state" : "19", "Inst_end_state" : "20"}]},
			{"Name" : "queue_y", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122", "Port" : "queue_y", "Inst_start_state" : "19", "Inst_end_state" : "20"}]},
			{"Name" : "binary", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122", "Port" : "binary", "Inst_start_state" : "19", "Inst_end_state" : "20"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_38_2_VITIS_LOOP_39_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "21", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state21"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.visited_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.queue_x_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.queue_y_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_31_1_fu_115", "Parent" : "0", "Child" : ["5"],
		"CDFG" : "find_largest_component_hw_Pipeline_VITIS_LOOP_31_1",
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
			{"Name" : "n", "Type" : "None", "Direction" : "I"},
			{"Name" : "visited", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_31_1", "PipelineType" : "NotSupport"}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_31_1_fu_115.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122", "Parent" : "0", "Child" : ["7", "8", "9", "10", "11", "12"],
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
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122.sitofp_32ns_32_6_no_dsp_1_U16", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122.sitofp_32s_32_6_no_dsp_1_U17", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122.mul_32s_32s_32_1_1_U18", "Parent" : "6"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122.mul_32s_32s_32_1_1_U19", "Parent" : "6"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122.mul_32s_32s_32_2_1_U21", "Parent" : "6"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4_fu_122.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32ns_32_6_no_dsp_1_U32", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_32ns_64_2_1_U34", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_19s_19s_19_4_1_U35", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	find_largest_component_hw {
		width {Type I LastRead 0 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		visited {Type IO LastRead -1 FirstWrite -1}
		queue_x {Type IO LastRead -1 FirstWrite -1}
		queue_y {Type IO LastRead -1 FirstWrite -1}
		binary {Type I LastRead 9 FirstWrite -1}}
	find_largest_component_hw_Pipeline_VITIS_LOOP_31_1 {
		n {Type I LastRead 0 FirstWrite -1}
		visited {Type O LastRead -1 FirstWrite 0}}
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
]}

set Spec2ImplPortList { 
	width { ap_none {  { width in_data 0 32 } } }
	height { ap_none {  { height in_data 0 32 } } }
	binary { ap_memory {  { binary_address0 mem_address 1 19 }  { binary_ce0 mem_ce 1 1 }  { binary_q0 in_data 0 2 }  { binary_address1 MemPortADDR2 1 19 }  { binary_ce1 MemPortCE2 1 1 }  { binary_q1 MemPortDOUT2 0 2 } } }
}
