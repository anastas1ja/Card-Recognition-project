Poker Card Recognition – SystemC Virtual Platform

This project is a SystemC virtual platform that recognizes poker cards from JPG images. The original C++ algorithm has been converted into a hardware accelerator that communicates with a CPU model using TLM transactions.

1. Functionality

The program takes a path to a JPG image as a command line argument. A hardware accelerator processes the image, and information about the recognized card gets printed, such as "Card Rank : queen | Card Suit :  spades" (this is the expected output), followed by a performance summary including BRAM write time, hardware acceleration time, total time, and processing rate in frames per second.

2. System Architecture

The platform consists of five main modules.

- The *CPU* module loads the image from disk using an OpenCV function, writes it to shared memory, configures hardware registers, begins with hardware driven analysis of the input card, and reads the final result.

- The *ip_hard* module is the hardware accelerator. It reads the image from shared memory, performs grayscale conversion, binarization, connected component analysis, perspective warp, cropping, symbol splitting, and template matching. Every pixel operation includes a simulated delay, usually 5 nanoseconds, to bring to life real hardware timing.

- The *BRAM* module is a shared memory block of 1.5MB. It holds the input RGB image and the final result. It supports DMI for fast bulk transfers instead of Byte-to-Byte transactions.

- The *SysBus* module is an address decoder that routes transactions either to BRAM or to the ip_hard registers.

- The *VP* module (Virtual Platform) is the top-level wrapper that instantiates all other modules and binds their TLM sockets together.

3. Requirements and Libraries

You would need a C++17 compiler, the SystemC library (in our case, we used the version 3.0.2), OpenCV for image loading in the CPU module only, and the header-only stb_image library for loading template images.

Important note while using these libraries: 

After installation of SystemC, you must set the SYSTEMC environment variable and add the SystemC library path to LD_LIBRARY_PATH, preferably in the .bashrc file so that the setting persists.

4. Building and Running

To build the project, run 'make clean' followed by 'make'.
To run the simulation, type 'make run' or './vp' followed by the path to the input test image. To remove generated files, use 'make clean'.

5. Template Images

The template images must be placed in the Card_Imgs folder. Ranks go into the 'Ranks' subfolder and include images for numbers two through nine, zero for ten, jack, queen, king, and ace. Suits go into the 'Suits' subfolder and include hearts, diamonds, clubs, and spades.

6. Direct Memory Interface

BRAM supports DMI, which allows the CPU to write the entire image using a single memcpy instead of individual byte transactions. This reduces effective transfer time from a few milliseconds to about 50 nanoseconds.


7. Common Issues

If the SystemC shared library is not found, you need to add its path to LD_LIBRARY_PATH. If systemc.h is missing, check your SYSTEMC path in the Makefile. If OpenCV functions are undefined, install libopencv-dev. If you get multiple definition errors for stb_image functions, make sure that only ip_hard.cpp defines STB_IMAGE_IMPLEMENTATION.

10. Differences from the Standalone Version

The standalone version uses stb_image directly and executes all processing immediately without timing. The virtual platform uses OpenCV only in the CPU module for image loading. The hardware accelerator runs as a separate SystemC thread with explicit delays for every operation. Communication happens through TLM transactions and shared memory instead of direct function calls. Control is event driven using *start* and *done* signals rather than linear execution. The virtual platform models hardware timing at the nanosecond level and supports parallel execution of the CPU and hardware threads.
