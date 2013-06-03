! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

    SUBROUTINE DIST                                                    ! DIST.irp.f:   1
  use atoms_mod
  character*(4) :: irp_here = 'dist'                                   ! DIST.irp.f:   1
    PARAMETER(natomax=400)                                             ! DIST.irp.f:   2
    logical :: yw                                                      ! DIST.irp.f:   4
    integer i,j                                                        ! DIST.irp.f:   5
    double precision atyp(natomax)                                     ! DIST.irp.f:   6
    double precision xx(natomax),yy(natomax),zz(natomax)               ! DIST.irp.f:   7
    double precision ddist(natomax,natomax)                            ! DIST.irp.f:   8
    common /coord/xx,yy,zz,atyp                                        ! DIST.irp.f:  10
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
    yw=.false.                                                         ! DIST.irp.f:  12
    open(unit=66,status='unknown',file='dist.dat',form='formatted')    ! DIST.irp.f:  14
        write(6,*)'In DIST'                                            ! DIST.irp.f:  19
    if(yw)then                                                         ! DIST.irp.f:  20
    endif                                                              ! DIST.irp.f:  23
    do j=1,atoms                                                       ! DIST.irp.f:  25
        do i=1,j                                                       ! DIST.irp.f:  26
            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) ) ! DIST.irp.f:  28
            if(ddist(j,i).ne.0)then                                    ! DIST.irp.f:  31
                write(6,1000)j-1,i-1,ddist(j,i)                        ! DIST.irp.f:  32
                write(66,1000)j-1,i-1,ddist(j,i)                       ! DIST.irp.f:  33
            endif                                                      ! DIST.irp.f:  34
            if(yw)then                                                 ! DIST.irp.f:  35
                write(6,1000)i,j,ddist(j,i)                            ! DIST.irp.f:  36
                write(66,1000)i,j,ddist(j,i)                           ! DIST.irp.f:  37
            endif                                                      ! DIST.irp.f:  38
        enddo                                                          ! DIST.irp.f:  39
    enddo                                                              ! DIST.irp.f:  40
1000 FORMAT(3x,('R(',I3,',',I3,') = ',F12.4))                          ! DIST.irp.f:  42
end                                                                    ! DIST.irp.f:  44
