IRPF90 = irpf90  #-a -d
FC     = ifort
FCFLAGS= -g -O3 -axSSE4.2,SSE4.1,SSSE3,SSE3,SSE2 -traceback -check -debug #-C -heap-arrays

SRC=
OBJ=
LIB= -L$(MKLROOT)/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -openmp -lpthread -lm

include irpf90.make

irpf90.make: $(wildcard *.irp.f)
	$(IRPF90)
