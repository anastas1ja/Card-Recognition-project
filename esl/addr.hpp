#ifndef _ADDR_H_
#define _ADDR_H_

#include <systemc>
#include <tlm>

// ─── Bus / Interconnect ───────────────────────────────────────────────────────
#define BUS_WIDTH          4          // 32-bit data bus
#define INTERCONNECT_DELAY 10         // ns

// ─── Frame dimensions ─────────────────────────────────────────────────────────
// Input image is loaded raw from JPEG; the card pipeline works on whatever
// size is provided.  We reserve enough BRAM for a 640×480 RGB image (worst-case)
// so that the VP can accept any typical card photo without recompilation.
// The actual pixel count is communicated through IP registers at run-time.
#define FRAME_WIDTH_MAX  240
#define FRAME_HEIGHT_MAX 320

// Legacy aliases used by other files (kept for compatibility)
#define WIDTH  FRAME_WIDTH_MAX
#define HEIGHT FRAME_HEIGHT_MAX
#define SIZE   (WIDTH * HEIGHT)
#define FRAME_WIDTH  WIDTH
#define FRAME_HEIGHT HEIGHT

// ─── BRAM layout ─────────────────────────────────────────────────────────────
// Input  frame  : RGB, up to 640×480×3 = 921 600 B
// Output region : 2 × uint32_t  (rank + suit result)
// Total reserved: 1 MB  →  comfortably fits in 1.5 MB BRAM
#define BRAM_INPUT_FRAME_ADDR  0x00000000u
#define BRAM_RESULT_ADDR       (BRAM_INPUT_FRAME_ADDR + (FRAME_WIDTH_MAX * FRAME_HEIGHT_MAX * 3u))
// BRAM_RESULT_ADDR = 0x000E1000  (921 600 = 0xE1000)

#define BRAM_SIZE              0x180000u  // 1.5 MB

#define VP_BRAM_ADDR_LOW   0x00000000u
#define VP_BRAM_ADDR_HIGH  (VP_BRAM_ADDR_LOW + BRAM_SIZE)

// ─── IP_HARD address space ────────────────────────────────────────────────────
#define VP_IP_CORE_ADDR_LOW  0x40000000u
#define VP_IP_CORE_ADDR_HIGH 0x40000030u

// ─── IP_HARD registers (offsets from VP_IP_CORE_ADDR_LOW) ────────────────────
#define ADDR_FRAME_WIDTH      0x00u  // RW – actual image width  (pixels)
#define ADDR_FRAME_HEIGHT     0x04u  // RW – actual image height (pixels)
#define ADDR_CTRL_REG         0x08u  // RW – bit0=START, bit1=RESET
#define ADDR_STATUS_REG       0x0Cu  // RO – bit0=READY (1=done, 0=busy)
#define ADDR_INPUT_ADDR_REG   0x10u  // RW – BRAM address of input frame
#define ADDR_OUTPUT_ADDR_REG  0x14u  // RW – BRAM address of result area
// ── New registers for card recognition result ─────────────────────────────────
#define ADDR_CARD_RANK_REG    0x18u  // RO – detected rank  (0-13, see rankName())
#define ADDR_CARD_SUIT_REG    0x1Cu  // RO – detected suit  (0-3,  see suitName())

// ─── Control / Status bitmasks ────────────────────────────────────────────────
#define CTRL_START_BIT   0x01u
#define CTRL_RESET_BIT   0x02u
#define STATUS_READY_BIT 0x01u

#endif // _ADDR_H_
