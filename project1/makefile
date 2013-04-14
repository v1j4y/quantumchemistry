# Makefile
# Dans le shell, avant de compiler faire:
# source /opt/intel/bin/compilervars.sh intel64
# Mettre aussi cette ligne dans le script pour le qsub
# Comme on genere des gros fichiers, il ne faut pas tourner sur le /home
# mais plutot sur /mnt/lustre/$USER
.SUFFIXES: .f90
NAME=MAIN
FFLAGS= -g -O3 -axSSE4.2,SSE4.1,SSSE3,SSE3,SSE2 -traceback -check -debug #-C -heap-arrays
LFLAGS= -L$(MKLROOT)/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -openmp -lpthread -lm
OBJS = \
MAIN.o\
DIST.o\
INP.o

.f90.o:
	ifort $(FFLAGS) -c $*.f90

MAIN.toc.2G :	$(OBJS)
	ifort $(OBJS) -o $(NAME) $(LFLAGS)

