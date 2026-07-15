// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCARD_RECOGNIZER_HW_H
#define XCARD_RECOGNIZER_HW_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xcard_recognizer_hw_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XCard_recognizer_hw_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XCard_recognizer_hw;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCard_recognizer_hw_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCard_recognizer_hw_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCard_recognizer_hw_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCard_recognizer_hw_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XCard_recognizer_hw_Initialize(XCard_recognizer_hw *InstancePtr, u16 DeviceId);
XCard_recognizer_hw_Config* XCard_recognizer_hw_LookupConfig(u16 DeviceId);
int XCard_recognizer_hw_CfgInitialize(XCard_recognizer_hw *InstancePtr, XCard_recognizer_hw_Config *ConfigPtr);
#else
int XCard_recognizer_hw_Initialize(XCard_recognizer_hw *InstancePtr, const char* InstanceName);
int XCard_recognizer_hw_Release(XCard_recognizer_hw *InstancePtr);
#endif

void XCard_recognizer_hw_Start(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_IsDone(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_IsIdle(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_IsReady(XCard_recognizer_hw *InstancePtr);
void XCard_recognizer_hw_EnableAutoRestart(XCard_recognizer_hw *InstancePtr);
void XCard_recognizer_hw_DisableAutoRestart(XCard_recognizer_hw *InstancePtr);

void XCard_recognizer_hw_Set_input_rgb(XCard_recognizer_hw *InstancePtr, u64 Data);
u64 XCard_recognizer_hw_Get_input_rgb(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_Get_result_rank(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_Get_result_rank_vld(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_Get_result_suit(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_Get_result_suit_vld(XCard_recognizer_hw *InstancePtr);
void XCard_recognizer_hw_Set_width(XCard_recognizer_hw *InstancePtr, u32 Data);
u32 XCard_recognizer_hw_Get_width(XCard_recognizer_hw *InstancePtr);
void XCard_recognizer_hw_Set_height(XCard_recognizer_hw *InstancePtr, u32 Data);
u32 XCard_recognizer_hw_Get_height(XCard_recognizer_hw *InstancePtr);

void XCard_recognizer_hw_InterruptGlobalEnable(XCard_recognizer_hw *InstancePtr);
void XCard_recognizer_hw_InterruptGlobalDisable(XCard_recognizer_hw *InstancePtr);
void XCard_recognizer_hw_InterruptEnable(XCard_recognizer_hw *InstancePtr, u32 Mask);
void XCard_recognizer_hw_InterruptDisable(XCard_recognizer_hw *InstancePtr, u32 Mask);
void XCard_recognizer_hw_InterruptClear(XCard_recognizer_hw *InstancePtr, u32 Mask);
u32 XCard_recognizer_hw_InterruptGetEnabled(XCard_recognizer_hw *InstancePtr);
u32 XCard_recognizer_hw_InterruptGetStatus(XCard_recognizer_hw *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
