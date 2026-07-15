set SynModuleInfo {
  {SRCNAME card_recognizer_hw_Pipeline_GRAYSCALE_LOOP MODELNAME card_recognizer_hw_Pipeline_GRAYSCALE_LOOP RTLNAME card_recognizer_hw_card_recognizer_hw_Pipeline_GRAYSCALE_LOOP
    SUBMODULES {
      {MODELNAME card_recognizer_hw_mul_8ns_8ns_15_1_1 RTLNAME card_recognizer_hw_mul_8ns_8ns_15_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_mac_muladd_8ns_5ns_15ns_15_4_1 RTLNAME card_recognizer_hw_mac_muladd_8ns_5ns_15ns_15_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_mac_muladd_8ns_8ns_15ns_16_4_1 RTLNAME card_recognizer_hw_mac_muladd_8ns_8ns_15ns_16_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_flow_control_loop_pipe_sequential_init RTLNAME card_recognizer_hw_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME card_recognizer_hw_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME card_recognizer_hw_Pipeline_BINARIZE_LOOP MODELNAME card_recognizer_hw_Pipeline_BINARIZE_LOOP RTLNAME card_recognizer_hw_card_recognizer_hw_Pipeline_BINARIZE_LOOP}
  {SRCNAME find_largest_component_ccl_Pipeline_INIT_COMPONENTS MODELNAME find_largest_component_ccl_Pipeline_INIT_COMPONENTS RTLNAME card_recognizer_hw_find_largest_component_ccl_Pipeline_INIT_COMPONENTS}
  {SRCNAME find_largest_component_ccl_Pipeline_INIT_ROWS MODELNAME find_largest_component_ccl_Pipeline_INIT_ROWS RTLNAME card_recognizer_hw_find_largest_component_ccl_Pipeline_INIT_ROWS}
  {SRCNAME find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW MODELNAME find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW RTLNAME card_recognizer_hw_find_largest_component_ccl_Pipeline_CLEAR_CURR_ROW}
  {SRCNAME find_largest_component_ccl_Pipeline_CCL_X_LOOP MODELNAME find_largest_component_ccl_Pipeline_CCL_X_LOOP RTLNAME card_recognizer_hw_find_largest_component_ccl_Pipeline_CCL_X_LOOP
    SUBMODULES {
      {MODELNAME card_recognizer_hw_mux_21_8_1_1 RTLNAME card_recognizer_hw_mux_21_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME find_largest_component_ccl_Pipeline_COPY_ROW MODELNAME find_largest_component_ccl_Pipeline_COPY_ROW RTLNAME card_recognizer_hw_find_largest_component_ccl_Pipeline_COPY_ROW}
  {SRCNAME find_largest_component_ccl_Pipeline_SELECT_BEST MODELNAME find_largest_component_ccl_Pipeline_SELECT_BEST RTLNAME card_recognizer_hw_find_largest_component_ccl_Pipeline_SELECT_BEST}
  {SRCNAME find_largest_component_ccl MODELNAME find_largest_component_ccl RTLNAME card_recognizer_hw_find_largest_component_ccl
    SUBMODULES {
      {MODELNAME card_recognizer_hw_mul_mul_15s_15s_15_4_1 RTLNAME card_recognizer_hw_mul_mul_15s_15s_15_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_find_largest_component_ccl_prev_label_V_RAM_AUTO_1R1W RTLNAME card_recognizer_hw_find_largest_component_ccl_prev_label_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_find_largest_component_ccl_parent_V_RAM_AUTO_1R1W RTLNAME card_recognizer_hw_find_largest_component_ccl_parent_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_find_largest_component_ccl_count_RAM_AUTO_1R1W RTLNAME card_recognizer_hw_find_largest_component_ccl_count_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP MODELNAME card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP RTLNAME card_recognizer_hw_card_recognizer_hw_Pipeline_ROI_Y_LOOP_ROI_X_LOOP
    SUBMODULES {
      {MODELNAME card_recognizer_hw_mac_muladd_7ns_15s_8ns_15_4_1 RTLNAME card_recognizer_hw_mac_muladd_7ns_15s_8ns_15_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME card_recognizer_hw MODELNAME card_recognizer_hw RTLNAME card_recognizer_hw IS_TOP 1
    SUBMODULES {
      {MODELNAME card_recognizer_hw_mul_32s_32s_32_2_1 RTLNAME card_recognizer_hw_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_mul_mul_10s_11ns_22_4_1 RTLNAME card_recognizer_hw_mul_mul_10s_11ns_22_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_gray_V_RAM_2P_BRAM_1R1W RTLNAME card_recognizer_hw_gray_V_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_binary_V_RAM_2P_BRAM_1R1W RTLNAME card_recognizer_hw_binary_V_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_control_s_axi RTLNAME card_recognizer_hw_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
