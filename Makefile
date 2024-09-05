# Compiler
NVCC = /usr/local/cuda/bin/nvcc

CPP = g++
CPPFLAGS =

# Compiler flags
NVCCFLAGS = -Xcompiler -Wall

# Source files
SRCS = $(wildcard *.cu)

# Object files
#OBJS = $(SRCS:.cu=.o)

# Executable name
EXEC = add_cpu add_cuda add_threads add_blocks

# Default target
all: $(EXEC)

# Link object files to create the executable
#$(EXEC): $(OBJS)
#       $(NVCC) $(NVCCFLAGS) -o $@ $^

add_cpu: add_cpu.cpp
        $(CPP) $(CPPFLAGS) -o $@ $^

add_cuda: add_cuda.cu
        $(NVCC) $(NVCCFLAGS) -o $@ $^

add_threads: add_threads.cu
        $(NVCC) $(NVCCFLAGS) -o $@ $^

add_blocks: add_blocks.cu
        $(NVCC) $(NVCCFLAGS) -o $@ $^

# Clean up build files
clean:
        rm -f $(OBJS) $(EXEC)

# Phony targets
.PHONY: all clean
