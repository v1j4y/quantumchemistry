! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

    SUBROUTINE INP                                                      ! INP.irp.f:   1
  character*(3) :: irp_here = 'inp'                                     ! INP.irp.f:   1
    PARAMETER(natomax=400)                                              ! INP.irp.f:   2
    integer atoms                                                       ! INP.irp.f:   4
    double precision atyp(natomax)                                      ! INP.irp.f:   5
    double precision xx(natomax),yy(natomax),zz(natomax)                ! INP.irp.f:   7
    logical :: yw                                                       ! INP.irp.f:   9
    common /coord/xx,yy,zz,atyp                                         ! INP.irp.f:  11
    yw = .true.                                                         ! INP.irp.f:  13
    open(unit=11,status='old',file='geo.inp',form='formatted')          ! INP.irp.f:  17
    write(6,*)'reading input'                                           ! INP.irp.f:  20
    read(11,*)atoms;                                                    ! INP.irp.f:  24
    write(6,*)'No of atoms: ',atoms                                     ! INP.irp.f:  26
    write(6,*)'coordinates: '                                           ! INP.irp.f:  27
    do j=1,atoms                                                        ! INP.irp.f:  28
    read(11,*)atyp(j),xx(j),yy(j),zz(j)                                 ! INP.irp.f:  30
    if(yw)then                                                          ! INP.irp.f:  32
        write(6,*)xx(j),yy(j),zz(j)                                     ! INP.irp.f:  33
    endif                                                               ! INP.irp.f:  34
    enddo                                                               ! INP.irp.f:  36
    call DIST(atoms)                                                    ! INP.irp.f:  38
    call ANGLES(atoms)                                                  ! INP.irp.f:  39
    call HUCKEL(atoms)                                                  ! INP.irp.f:  40
    call MOLDEN(atoms)                                                  ! INP.irp.f:  41
                                                                        ! INP.irp.f:  41
end                                                                     ! INP.irp.f:  43
