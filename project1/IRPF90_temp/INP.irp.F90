! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

    SUBROUTINE INP                                                      ! INP.irp.f:   1
  use atoms_mod
  character*(3) :: irp_here = 'inp'                                     ! INP.irp.f:   1
    PARAMETER(natomax=400)                                              ! INP.irp.f:   2
    double precision atyp(natomax)                                      ! INP.irp.f:   4
    double precision xx(natomax),yy(natomax),zz(natomax)                ! INP.irp.f:   6
    logical :: yw                                                       ! INP.irp.f:   8
    common /coord/xx,yy,zz,atyp                                         ! INP.irp.f:  10
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
    yw = .true.                                                         ! INP.irp.f:  12
    open(unit=11,status='old',file='geo.inp',form='formatted')          ! INP.irp.f:  16
    open(unit=200,status='new',file='dist.dat',form='formatted')        ! INP.irp.f:  17
    open(unit=201,status='new',file='atyp.dat',form='formatted')        ! INP.irp.f:  18
    write(6,*)'reading input'                                           ! INP.irp.f:  21
    write(6,*)'No of atoms: ',atoms                                     ! INP.irp.f:  27
    write(6,*)'coordinates: '                                           ! INP.irp.f:  28
    do j=1,atoms                                                        ! INP.irp.f:  29
    read(11,*)atyp(j),xx(j),yy(j),zz(j)                                 ! INP.irp.f:  31
        write(200,*)xx(j),yy(j),zz(j)                                   ! INP.irp.f:  33
        write(201,*)atyp(j)                                             ! INP.irp.f:  34
    if(yw)then                                                          ! INP.irp.f:  35
        write(6,*)xx(j),yy(j),zz(j)                                     ! INP.irp.f:  36
    endif                                                               ! INP.irp.f:  37
    enddo                                                               ! INP.irp.f:  39
    call DIST                                                           ! INP.irp.f:  41
    call ANGLES                                                         ! INP.irp.f:  42
    call MOLDEN                                                         ! INP.irp.f:  44
end                                                                     ! INP.irp.f:  46
