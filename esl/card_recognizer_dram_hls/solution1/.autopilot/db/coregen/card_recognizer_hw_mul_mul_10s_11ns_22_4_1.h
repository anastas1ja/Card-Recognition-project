// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __card_recognizer_hw_mul_mul_10s_11ns_22_4_1__HH__
#define __card_recognizer_hw_mul_mul_10s_11ns_22_4_1__HH__
#include "card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int dout_WIDTH>
SC_MODULE(card_recognizer_hw_mul_mul_10s_11ns_22_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4 card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U;

    SC_CTOR(card_recognizer_hw_mul_mul_10s_11ns_22_4_1):  card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U ("card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U") {
        card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U.clk(clk);
        card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U.rst(reset);
        card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U.ce(ce);
        card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U.a(din0);
        card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U.b(din1);
        card_recognizer_hw_mul_mul_10s_11ns_22_4_1_DSP48_4_U.p(dout);

    }

};

#endif //
