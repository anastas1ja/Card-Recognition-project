set moduleName card_recognizer_hw
set isTopModule 1
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
set C_modelName {card_recognizer_hw}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_rgb int 24 regular {array 19200 { 1 3 } 1 1 }  }
	{ result_rank int 32 regular {axi_slave 1}  }
	{ result_suit int 32 regular {axi_slave 1}  }
	{ width int 32 regular {axi_slave 0}  }
	{ height int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_rgb", "interface" : "memory", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "result_rank", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":16}, "offset_end" : {"out":23}} , 
 	{ "Name" : "result_suit", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":32}, "offset_end" : {"out":39}} , 
 	{ "Name" : "width", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "height", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ input_rgb_address0 sc_out sc_lv 15 signal 0 } 
	{ input_rgb_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_rgb_q0 sc_in sc_lv 24 signal 0 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"card_recognizer_hw","role":"start","value":"0","valid_bit":"0"},{"name":"card_recognizer_hw","role":"continue","value":"0","valid_bit":"4"},{"name":"card_recognizer_hw","role":"auto_start","value":"0","valid_bit":"7"},{"name":"width","role":"data","value":"48"},{"name":"height","role":"data","value":"56"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"card_recognizer_hw","role":"start","value":"0","valid_bit":"0"},{"name":"card_recognizer_hw","role":"done","value":"0","valid_bit":"1"},{"name":"card_recognizer_hw","role":"idle","value":"0","valid_bit":"2"},{"name":"card_recognizer_hw","role":"ready","value":"0","valid_bit":"3"},{"name":"card_recognizer_hw","role":"auto_start","value":"0","valid_bit":"7"},{"name":"result_rank","role":"data","value":"16"}, {"name":"result_rank","role":"valid","value":"20","valid_bit":"0"},{"name":"result_suit","role":"data","value":"32"}, {"name":"result_suit","role":"valid","value":"36","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "input_rgb_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "input_rgb", "role": "address0" }} , 
 	{ "name": "input_rgb_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_rgb", "role": "ce0" }} , 
 	{ "name": "input_rgb_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "input_rgb", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "8", "10", "37", "40", "41", "42"],
		"CDFG" : "card_recognizer_hw",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "271846", "EstimateLatencyMax" : "329469",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_rgb", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP_fu_150", "Port" : "input_rgb", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "result_rank", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "result_suit", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "width", "Type" : "None", "Direction" : "I"},
			{"Name" : "height", "Type" : "None", "Direction" : "I"},
			{"Name" : "gray_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP_fu_150", "Port" : "gray_V", "Inst_start_state" : "4", "Inst_end_state" : "5"},
					{"ID" : "8", "SubInstance" : "grp_card_recognizer_hw_Pipeline_BINARIZE_LOOP_fu_159", "Port" : "gray_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "binary_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_card_recognizer_hw_Pipeline_BINARIZE_LOOP_fu_159", "Port" : "binary_V", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "10", "SubInstance" : "grp_find_largest_component_ccl_fu_168", "Port" : "binary_V", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "37", "SubInstance" : "grp_card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP_fu_176", "Port" : "binary_V", "Inst_start_state" : "14", "Inst_end_state" : "15"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gray_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.binary_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP_fu_150", "Parent" : "0", "Child" : ["4", "5", "6", "7"],
		"CDFG" : "card_recognizer_hw_Pipeline_GRAYSCALE_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19206", "EstimateLatencyMax" : "19206",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "trunc_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_rgb", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "gray_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "GRAYSCALE_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter5", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter5", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP_fu_150.mul_8ns_8ns_15_1_1_U1", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP_fu_150.mac_muladd_8ns_5ns_15ns_15_4_1_U2", "Parent" : "3"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP_fu_150.mac_muladd_8ns_8ns_15ns_16_4_1_U3", "Parent" : "3"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP_fu_150.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_BINARIZE_LOOP_fu_159", "Parent" : "0", "Child" : ["9"],
		"CDFG" : "card_recognizer_hw_Pipeline_BINARIZE_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "19203", "EstimateLatencyMax" : "19203",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "trunc_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "gray_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "binary_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "BINARIZE_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_BINARIZE_LOOP_fu_159.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168", "Parent" : "0", "Child" : ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "23", "25", "27", "29", "33", "36"],
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
					{"ID" : "29", "SubInstance" : "grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180", "Port" : "binary_V", "Inst_start_state" : "7", "Inst_end_state" : "8"}]}],
		"Loop" : [
			{"Name" : "CCL_Y_LOOP", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "12", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.prev_label_V_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.prev_label_V_1_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.curr_label_V_U", "Parent" : "10"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.curr_label_V_1_U", "Parent" : "10"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.parent_V_U", "Parent" : "10"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.min_x_V_U", "Parent" : "10"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.min_y_V_U", "Parent" : "10"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.max_x_V_U", "Parent" : "10"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.max_y_V_U", "Parent" : "10"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.count_U", "Parent" : "10"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_INIT_COMPONENTS_fu_130", "Parent" : "10", "Child" : ["22"],
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
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_INIT_COMPONENTS_fu_130.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_INIT_ROWS_fu_146", "Parent" : "10", "Child" : ["24"],
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
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_INIT_ROWS_fu_146.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW_fu_158", "Parent" : "10", "Child" : ["26"],
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
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW_fu_158.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_SELECT_BEST_fu_164", "Parent" : "10", "Child" : ["28"],
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
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_SELECT_BEST_fu_164.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180", "Parent" : "10", "Child" : ["30", "31", "32"],
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
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180.mux_21_8_1_1_U25", "Parent" : "29"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180.mux_21_8_1_1_U26", "Parent" : "29"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_CCL_X_LOOP_fu_180.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_COPY_ROW_fu_201", "Parent" : "10", "Child" : ["34", "35"],
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
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_COPY_ROW_fu_201.mux_21_8_1_1_U44", "Parent" : "33"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.grp_find_largest_component_ccl_Pipeline_COPY_ROW_fu_201.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_find_largest_component_ccl_fu_168.mul_mul_15s_15s_15_4_1_U61", "Parent" : "10"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP_fu_176", "Parent" : "0", "Child" : ["38", "39"],
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
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP_fu_176.mac_muladd_7ns_15s_8ns_15_4_1_U69", "Parent" : "37"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP_fu_176.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U78", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_10s_11ns_22_4_1_U79", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	card_recognizer_hw {
		input_rgb {Type I LastRead 0 FirstWrite -1}
		result_rank {Type O LastRead -1 FirstWrite 15}
		result_suit {Type O LastRead -1 FirstWrite 15}
		width {Type I LastRead 0 FirstWrite -1}
		height {Type I LastRead 0 FirstWrite -1}
		gray_V {Type IO LastRead -1 FirstWrite -1}
		binary_V {Type IO LastRead -1 FirstWrite -1}}
	card_recognizer_hw_Pipeline_GRAYSCALE_LOOP {
		trunc_ln {Type I LastRead 0 FirstWrite -1}
		input_rgb {Type I LastRead 0 FirstWrite -1}
		gray_V {Type O LastRead -1 FirstWrite 5}}
	card_recognizer_hw_Pipeline_BINARIZE_LOOP {
		trunc_ln {Type I LastRead 0 FirstWrite -1}
		gray_V {Type I LastRead 0 FirstWrite -1}
		binary_V {Type O LastRead -1 FirstWrite 2}}
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
		curr_label_V_1 {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "271846", "Max" : "329469"}
	, {"Name" : "Interval", "Min" : "271847", "Max" : "329470"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_rgb { ap_memory {  { input_rgb_address0 mem_address 1 15 }  { input_rgb_ce0 mem_ce 1 1 }  { input_rgb_q0 mem_dout 0 24 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
