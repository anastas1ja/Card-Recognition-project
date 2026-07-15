set moduleName find_largest_component_ccl
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
set C_modelName {find_largest_component_ccl}
set C_modelType { int 65 }
set C_modelArgList {
	{ width int 32 regular  }
	{ height int 32 regular  }
	{ binary_V int 1 regular {array 19200 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "width", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "height", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "binary_V", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 65} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ width sc_in sc_lv 32 signal 0 } 
	{ height sc_in sc_lv 32 signal 1 } 
	{ binary_V_address0 sc_out sc_lv 15 signal 2 } 
	{ binary_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ binary_V_q0 sc_in sc_lv 1 signal 2 } 
	{ ap_return_0 sc_out sc_lv 8 signal -1 } 
	{ ap_return_1 sc_out sc_lv 8 signal -1 } 
	{ ap_return_2 sc_out sc_lv 8 signal -1 } 
	{ ap_return_3 sc_out sc_lv 8 signal -1 } 
	{ ap_return_4 sc_out sc_lv 32 signal -1 } 
	{ ap_return_5 sc_out sc_lv 1 signal -1 } 
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
 	{ "name": "binary_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "binary_V", "role": "address0" }} , 
 	{ "name": "binary_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "binary_V", "role": "ce0" }} , 
 	{ "name": "binary_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "binary_V", "role": "q0" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }} , 
 	{ "name": "ap_return_5", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_5", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "13", "15", "17", "19", "23", "26"],
		"CDFG" : "find_largest_component_ccl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "271840", "EstimateLatencyMax" : "271840",
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
			{"Name" : "binary_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180", "Port" : "binary_V", "Inst_start_state" : "7", "Inst_end_state" : "8"}]}],
		"Loop" : [
			{"Name" : "CCL_Y_LOOP", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.prev_label_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.prev_label_V_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.curr_label_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.curr_label_V_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parent_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.min_x_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.min_y_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.max_x_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.max_y_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.count_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_INIT_COMPONENTS_fu_130", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "find_largest_component_ccl_Pipeline_INIT_COMPONENTS",
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
			{"Name" : "parent_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "min_x_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "min_y_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_x_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_y_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "count", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "INIT_COMPONENTS", "PipelineType" : "NotSupport"}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_INIT_COMPONENTS_fu_130.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_INIT_ROWS_fu_146", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "find_largest_component_ccl_Pipeline_INIT_ROWS",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "162", "EstimateLatencyMax" : "162",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "curr_label_V_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "curr_label_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "prev_label_V_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "prev_label_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "INIT_ROWS", "PipelineType" : "NotSupport"}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_INIT_ROWS_fu_146.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW_fu_158", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "162", "EstimateLatencyMax" : "162",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "curr_label_V_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "curr_label_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "CLEAR_CURR_ROW", "PipelineType" : "NotSupport"}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW_fu_158.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_SELECT_BEST_fu_164", "Parent" : "0", "Child" : ["18"],
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
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_SELECT_BEST_fu_164.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180", "Parent" : "0", "Child" : ["20", "21", "22"],
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
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180.mux_21_8_1_1_U25", "Parent" : "19"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180.mux_21_8_1_1_U26", "Parent" : "19"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_COPY_ROW_fu_201", "Parent" : "0", "Child" : ["24", "25"],
		"CDFG" : "find_largest_component_ccl_Pipeline_COPY_ROW",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "162", "EstimateLatencyMax" : "162",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "prev_label_V_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "prev_label_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "curr_label_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "curr_label_V_1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "COPY_ROW", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_COPY_ROW_fu_201.mux_21_8_1_1_U44", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_Pipeline_COPY_ROW_fu_201.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_15s_15s_15_4_1_U61", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	find_largest_component_ccl {
		width {Type I LastRead 1 FirstWrite -1}
		height {Type I LastRead 1 FirstWrite -1}
		binary_V {Type I LastRead 0 FirstWrite -1}}
	find_largest_component_ccl_Pipeline_INIT_COMPONENTS {
		parent_V {Type O LastRead -1 FirstWrite 0}
		min_x_V {Type O LastRead -1 FirstWrite 0}
		min_y_V {Type O LastRead -1 FirstWrite 0}
		max_x_V {Type O LastRead -1 FirstWrite 0}
		max_y_V {Type O LastRead -1 FirstWrite 0}
		count {Type O LastRead -1 FirstWrite 0}}
	find_largest_component_ccl_Pipeline_INIT_ROWS {
		curr_label_V_1 {Type O LastRead -1 FirstWrite 0}
		curr_label_V {Type O LastRead -1 FirstWrite 0}
		prev_label_V_1 {Type O LastRead -1 FirstWrite 0}
		prev_label_V {Type O LastRead -1 FirstWrite 0}}
	find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW {
		curr_label_V_1 {Type O LastRead -1 FirstWrite 0}
		curr_label_V {Type O LastRead -1 FirstWrite 0}}
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
		p_out1 {Type O LastRead -1 FirstWrite 1}}
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
		binary_V {Type I LastRead 0 FirstWrite -1}}
	find_largest_component_ccl_Pipeline_COPY_ROW {
		prev_label_V_1 {Type O LastRead -1 FirstWrite 1}
		prev_label_V {Type O LastRead -1 FirstWrite 1}
		curr_label_V {Type I LastRead 0 FirstWrite -1}
		curr_label_V_1 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "271840", "Max" : "271840"}
	, {"Name" : "Interval", "Min" : "271840", "Max" : "271840"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	width { ap_none {  { width in_data 0 32 } } }
	height { ap_none {  { height in_data 0 32 } } }
	binary_V { ap_memory {  { binary_V_address0 mem_address 1 15 }  { binary_V_ce0 mem_ce 1 1 }  { binary_V_q0 mem_dout 0 1 } } }
}
