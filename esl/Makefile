CC      = g++
LDFLAGS = -L/usr/local/systemc-3.0.2/lib-linux64 -lsystemc -lm \
          `pkg-config --libs opencv4`
CFLAGS  = -I/usr/local/systemc-3.0.2/include -I. \
          `pkg-config --cflags opencv4` \
          -std=c++17 -O2 -Wall -Wextra \
          -Wno-unused-parameter -Wno-reorder

SRCS = main.cpp vp.cpp cpu.cpp ip_hard.cpp sys_bus.cpp bram.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = vp

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET) *.jpg

run: $(TARGET)
	./$(TARGET) karta.jpeg

.PHONY: all clean run
