// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcard_recognizer_hw.h"

extern XCard_recognizer_hw_Config XCard_recognizer_hw_ConfigTable[];

XCard_recognizer_hw_Config *XCard_recognizer_hw_LookupConfig(u16 DeviceId) {
	XCard_recognizer_hw_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCARD_RECOGNIZER_HW_NUM_INSTANCES; Index++) {
		if (XCard_recognizer_hw_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCard_recognizer_hw_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCard_recognizer_hw_Initialize(XCard_recognizer_hw *InstancePtr, u16 DeviceId) {
	XCard_recognizer_hw_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCard_recognizer_hw_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCard_recognizer_hw_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

