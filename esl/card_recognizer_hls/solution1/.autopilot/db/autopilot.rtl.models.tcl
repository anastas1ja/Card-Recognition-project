set SynModuleInfo {
  {SRCNAME card_recognizer_hw_Pipeline_VITIS_LOOP_105_1 MODELNAME card_recognizer_hw_Pipeline_VITIS_LOOP_105_1 RTLNAME card_recognizer_hw_card_recognizer_hw_Pipeline_VITIS_LOOP_105_1
    SUBMODULES {
      {MODELNAME card_recognizer_hw_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME card_recognizer_hw_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME card_recognizer_hw_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_sitofp_32ns_32_6_no_dsp_1 RTLNAME card_recognizer_hw_sitofp_32ns_32_6_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_flow_control_loop_pipe_sequential_init RTLNAME card_recognizer_hw_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME card_recognizer_hw_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME card_recognizer_hw_Pipeline_VITIS_LOOP_114_2 MODELNAME card_recognizer_hw_Pipeline_VITIS_LOOP_114_2 RTLNAME card_recognizer_hw_card_recognizer_hw_Pipeline_VITIS_LOOP_114_2}
  {SRCNAME find_largest_component_hw_Pipeline_VITIS_LOOP_31_1 MODELNAME find_largest_component_hw_Pipeline_VITIS_LOOP_31_1 RTLNAME card_recognizer_hw_find_largest_component_hw_Pipeline_VITIS_LOOP_31_1}
  {SRCNAME find_largest_component_hw_Pipeline_VITIS_LOOP_51_4 MODELNAME find_largest_component_hw_Pipeline_VITIS_LOOP_51_4 RTLNAME card_recognizer_hw_find_largest_component_hw_Pipeline_VITIS_LOOP_51_4
    SUBMODULES {
      {MODELNAME card_recognizer_hw_sitofp_32s_32_6_no_dsp_1 RTLNAME card_recognizer_hw_sitofp_32s_32_6_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 5 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_mul_32s_32s_32_1_1 RTLNAME card_recognizer_hw_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL fabric LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_mul_32s_32s_32_2_1 RTLNAME card_recognizer_hw_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME find_largest_component_hw MODELNAME find_largest_component_hw RTLNAME card_recognizer_hw_find_largest_component_hw
    SUBMODULES {
      {MODELNAME card_recognizer_hw_mul_32ns_32ns_64_2_1 RTLNAME card_recognizer_hw_mul_32ns_32ns_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_mul_mul_19s_19s_19_4_1 RTLNAME card_recognizer_hw_mul_mul_19s_19s_19_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_find_largest_component_hw_visited_RAM_AUTO_1R1W RTLNAME card_recognizer_hw_find_largest_component_hw_visited_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_find_largest_component_hw_queue_x_RAM_AUTO_1R1W RTLNAME card_recognizer_hw_find_largest_component_hw_queue_x_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME card_recognizer_hw MODELNAME card_recognizer_hw RTLNAME card_recognizer_hw IS_TOP 1
    SUBMODULES {
      {MODELNAME card_recognizer_hw_gray_RAM_AUTO_1R1W RTLNAME card_recognizer_hw_gray_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_binary_RAM_AUTO_1R1W RTLNAME card_recognizer_hw_binary_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME card_recognizer_hw_gmem_m_axi RTLNAME card_recognizer_hw_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME card_recognizer_hw_control_s_axi RTLNAME card_recognizer_hw_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
