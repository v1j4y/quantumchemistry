SRC += IRPF90_temp/irp_stack.irp.F90 IRPF90_temp/irp_touches.irp.F90 IRPF90_temp/MOLDEN.irp.F90 IRPF90_temp/MOLDEN.irp.module.F90 IRPF90_temp/readbasis.irp.F90 IRPF90_temp/readbasis.irp.module.F90 IRPF90_temp/BETA.irp.F90 IRPF90_temp/BETA.irp.module.F90 IRPF90_temp/MAIN.irp.F90 IRPF90_temp/MAIN.irp.module.F90 IRPF90_temp/HUCKEL.irp.F90 IRPF90_temp/HUCKEL.irp.module.F90 IRPF90_temp/DIST.irp.F90 IRPF90_temp/DIST.irp.module.F90 IRPF90_temp/test.irp.F90 IRPF90_temp/test.irp.module.F90 IRPF90_temp/atoms.irp.F90 IRPF90_temp/atoms.irp.module.F90 IRPF90_temp/basis.irp.F90 IRPF90_temp/basis.irp.module.F90 IRPF90_temp/nucrep.irp.F90 IRPF90_temp/nucrep.irp.module.F90 IRPF90_temp/INP.irp.F90 IRPF90_temp/INP.irp.module.F90 IRPF90_temp/ANGLES.irp.F90 IRPF90_temp/ANGLES.irp.module.F90
OBJ += IRPF90_temp/irp_stack.irp.o IRPF90_temp/MOLDEN.irp.o IRPF90_temp/MOLDEN.irp.module.o IRPF90_temp/readbasis.irp.o IRPF90_temp/readbasis.irp.module.o IRPF90_temp/BETA.irp.o IRPF90_temp/BETA.irp.module.o IRPF90_temp/HUCKEL.irp.o IRPF90_temp/HUCKEL.irp.module.o IRPF90_temp/DIST.irp.o IRPF90_temp/DIST.irp.module.o IRPF90_temp/atoms.irp.o IRPF90_temp/atoms.irp.module.o IRPF90_temp/basis.irp.o IRPF90_temp/basis.irp.module.o IRPF90_temp/nucrep.irp.o IRPF90_temp/nucrep.irp.module.o IRPF90_temp/INP.irp.o IRPF90_temp/INP.irp.module.o IRPF90_temp/ANGLES.irp.o IRPF90_temp/ANGLES.irp.module.o
OBJ1 = $(patsubst %, IRPF90_temp/%,$(notdir $(OBJ))) IRPF90_temp/irp_touches.irp.o 
ALL = MAIN test
ALL_OBJ = MAIN.irp.module.o MAIN.irp.o test.irp.module.o test.irp.o
ALL_OBJ1 = $(patsubst %, IRPF90_temp/%,$(notdir $(ALL_OBJ)))
all:$(ALL)
	@$(MAKE) -s move
MAIN: IRPF90_temp/MAIN.irp.o IRPF90_temp/MAIN.irp.module.o $(OBJ1)
	$(FC) -o $@ IRPF90_temp/$@.irp.o IRPF90_temp/$@.irp.module.o $(OBJ1) $(LIB)
	@$(MAKE) -s move
test: IRPF90_temp/test.irp.o IRPF90_temp/test.irp.module.o $(OBJ1)
	$(FC) -o $@ IRPF90_temp/$@.irp.o IRPF90_temp/$@.irp.module.o $(OBJ1) $(LIB)
	@$(MAKE) -s move
IRPF90_temp/MOLDEN.irp.o: IRPF90_temp/MOLDEN.irp.module.o  IRPF90_temp/readbasis.irp.module.o  IRPF90_temp/atoms.irp.module.o 
IRPF90_temp/readbasis.irp.o: IRPF90_temp/readbasis.irp.module.o  IRPF90_temp/basis.irp.module.o 
IRPF90_temp/BETA.irp.o: IRPF90_temp/BETA.irp.module.o  
IRPF90_temp/MAIN.irp.o: IRPF90_temp/MAIN.irp.module.o  
IRPF90_temp/HUCKEL.irp.o: IRPF90_temp/HUCKEL.irp.module.o  IRPF90_temp/atoms.irp.module.o  IRPF90_temp/BETA.irp.module.o 
IRPF90_temp/DIST.irp.o: IRPF90_temp/DIST.irp.module.o  IRPF90_temp/atoms.irp.module.o 
IRPF90_temp/test.irp.o: IRPF90_temp/test.irp.module.o  IRPF90_temp/atoms.irp.module.o  IRPF90_temp/nucrep.irp.module.o  IRPF90_temp/basis.irp.module.o 
IRPF90_temp/atoms.irp.o: IRPF90_temp/atoms.irp.module.o  
IRPF90_temp/basis.irp.o: IRPF90_temp/basis.irp.module.o  
IRPF90_temp/nucrep.irp.o: IRPF90_temp/nucrep.irp.module.o  
IRPF90_temp/INP.irp.o: IRPF90_temp/INP.irp.module.o  IRPF90_temp/atoms.irp.module.o 
IRPF90_temp/ANGLES.irp.o: IRPF90_temp/ANGLES.irp.module.o  IRPF90_temp/atoms.irp.module.o 
IRPF90_temp/irp_touches.irp.o:  IRPF90_temp/MOLDEN.irp.o IRPF90_temp/MOLDEN.irp.o  IRPF90_temp/readbasis.irp.o IRPF90_temp/readbasis.irp.o  IRPF90_temp/BETA.irp.o IRPF90_temp/BETA.irp.o  IRPF90_temp/HUCKEL.irp.o IRPF90_temp/HUCKEL.irp.o  IRPF90_temp/DIST.irp.o IRPF90_temp/DIST.irp.o  IRPF90_temp/atoms.irp.o IRPF90_temp/atoms.irp.o  IRPF90_temp/basis.irp.o IRPF90_temp/basis.irp.o  IRPF90_temp/nucrep.irp.o IRPF90_temp/nucrep.irp.o  IRPF90_temp/INP.irp.o IRPF90_temp/INP.irp.o  IRPF90_temp/ANGLES.irp.o IRPF90_temp/ANGLES.irp.o
IRPF90_temp/%.irp.module.o: IRPF90_temp/%.irp.module.F90
	$(FC) $(FCFLAGS) -c IRPF90_temp/$*.irp.module.F90 -o IRPF90_temp/$*.irp.module.o
IRPF90_temp/%.irp.o: IRPF90_temp/%.irp.module.o IRPF90_temp/%.irp.F90
	$(FC) $(FCFLAGS) -c IRPF90_temp/$*.irp.F90 -o IRPF90_temp/$*.irp.o
IRPF90_temp/%.irp.o: IRPF90_temp/%.irp.F90
	$(FC) $(FCFLAGS) -c IRPF90_temp/$*.irp.F90 -o IRPF90_temp/$*.irp.o
IRPF90_temp/%.o: %.F90
	$(FC) $(FCFLAGS) -c $*.F90 -o IRPF90_temp/$*.o
IRPF90_temp/%.o: %.f90
	$(FC) $(FCFLAGS) -c $*.f90 -o IRPF90_temp/$*.o
IRPF90_temp/%.o: %.f
	$(FC) $(FCFLAGS) -c $*.f -o IRPF90_temp/$*.o
IRPF90_temp/%.o: %.F
	$(FC) $(FCFLAGS) -c $*.F -o IRPF90_temp/$*.o
IRPF90_temp/%.irp.F90: irpf90.make

move:
	@mv -f *.mod IRPF90_temp/ 2> /dev/null | DO_NOTHING=

clean:
	rm -rf $(EXE) $(OBJ1) $(ALL_OBJ1) $(ALL)

veryclean:
	- $(MAKE) clean

	- rm -rf IRPF90_temp/ IRPF90_man/ irpf90.make irpf90_variables dist

