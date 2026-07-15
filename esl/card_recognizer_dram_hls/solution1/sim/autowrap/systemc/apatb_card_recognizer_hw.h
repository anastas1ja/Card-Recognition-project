// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_card_recognizer_hw (
volatile void* input_rgb,
volatile void* gray,
volatile void* binary,
volatile void* visited,
volatile void* queue_x,
volatile void* queue_y,
volatile void* result_rank,
volatile void* result_suit,
int width,
int height);
