// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of input_rgb
//        bit 31~0 - input_rgb[31:0] (Read/Write)
// 0x14 : Data signal of input_rgb
//        bit 31~0 - input_rgb[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of result_rank
//        bit 31~0 - result_rank[31:0] (Read)
// 0x20 : Control signal of result_rank
//        bit 0  - result_rank_ap_vld (Read/COR)
//        others - reserved
// 0x2c : Data signal of result_suit
//        bit 31~0 - result_suit[31:0] (Read)
// 0x30 : Control signal of result_suit
//        bit 0  - result_suit_ap_vld (Read/COR)
//        others - reserved
// 0x3c : Data signal of width
//        bit 31~0 - width[31:0] (Read/Write)
// 0x40 : reserved
// 0x44 : Data signal of height
//        bit 31~0 - height[31:0] (Read/Write)
// 0x48 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL          0x00
#define CONTROL_ADDR_GIE              0x04
#define CONTROL_ADDR_IER              0x08
#define CONTROL_ADDR_ISR              0x0c
#define CONTROL_ADDR_INPUT_RGB_DATA   0x10
#define CONTROL_BITS_INPUT_RGB_DATA   64
#define CONTROL_ADDR_RESULT_RANK_DATA 0x1c
#define CONTROL_BITS_RESULT_RANK_DATA 32
#define CONTROL_ADDR_RESULT_RANK_CTRL 0x20
#define CONTROL_ADDR_RESULT_SUIT_DATA 0x2c
#define CONTROL_BITS_RESULT_SUIT_DATA 32
#define CONTROL_ADDR_RESULT_SUIT_CTRL 0x30
#define CONTROL_ADDR_WIDTH_DATA       0x3c
#define CONTROL_BITS_WIDTH_DATA       32
#define CONTROL_ADDR_HEIGHT_DATA      0x44
#define CONTROL_BITS_HEIGHT_DATA      32
