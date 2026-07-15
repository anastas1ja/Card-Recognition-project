#ifndef ADAPTER_HPP
#define ADAPTER_HPP

// Prevent SystemC from exporting int64/uint64 to global namespace
#define SC_NO_INT64_ALIAS
#define SC_NO_UINT64_ALIAS

#include <systemc>

#undef int64
#undef uint64

// OpenCV – allowed only in cpu.cpp
#include <opencv2/opencv.hpp>

#endif // ADAPTER_HPP
