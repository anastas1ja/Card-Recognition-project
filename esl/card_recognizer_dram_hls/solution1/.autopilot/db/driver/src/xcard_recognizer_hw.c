// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xcard_recognizer_hw.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCard_recognizer_hw_CfgInitialize(XCard_recognizer_hw *InstancePtr, XCard_recognizer_hw_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCard_recognizer_hw_Start(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCard_recognizer_hw_IsDone(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCard_recognizer_hw_IsIdle(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCard_recognizer_hw_IsReady(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCard_recognizer_hw_EnableAutoRestart(XCard_recognizer_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCard_recognizer_hw_DisableAutoRestart(XCard_recognizer_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XCard_recognizer_hw_Get_result_rank(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_RESULT_RANK_DATA);
    return Data;
}

u32 XCard_recognizer_hw_Get_result_rank_vld(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_RESULT_RANK_CTRL);
    return Data & 0x1;
}

u32 XCard_recognizer_hw_Get_result_suit(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_RESULT_SUIT_DATA);
    return Data;
}

u32 XCard_recognizer_hw_Get_result_suit_vld(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_RESULT_SUIT_CTRL);
    return Data & 0x1;
}

void XCard_recognizer_hw_Set_width(XCard_recognizer_hw *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XCard_recognizer_hw_Get_width(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XCard_recognizer_hw_Set_height(XCard_recognizer_hw *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XCard_recognizer_hw_Get_height(XCard_recognizer_hw *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XCard_recognizer_hw_InterruptGlobalEnable(XCard_recognizer_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_GIE, 1);
}

void XCard_recognizer_hw_InterruptGlobalDisable(XCard_recognizer_hw *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_GIE, 0);
}

void XCard_recognizer_hw_InterruptEnable(XCard_recognizer_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_IER);
    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_IER, Register | Mask);
}

void XCard_recognizer_hw_InterruptDisable(XCard_recognizer_hw *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_IER);
    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCard_recognizer_hw_InterruptClear(XCard_recognizer_hw *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCard_recognizer_hw_WriteReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_ISR, Mask);
}

u32 XCard_recognizer_hw_InterruptGetEnabled(XCard_recognizer_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_IER);
}

u32 XCard_recognizer_hw_InterruptGetStatus(XCard_recognizer_hw *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCard_recognizer_hw_ReadReg(InstancePtr->Control_BaseAddress, XCARD_RECOGNIZER_HW_CONTROL_ADDR_ISR);
}

