! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

    SUBROUTINE DIST(atoms)                                             ! DIST.irp.f:   1
  character*(4) :: irp_here = 'dist'                                   ! DIST.irp.f:   1
    PARAMETER(natomax=400)                                             ! DIST.irp.f:   2
    logical :: yw                                                      ! DIST.irp.f:   4
    integer i,j                                                        ! DIST.irp.f:   5
    integer atoms                                                      ! DIST.irp.f:   6
    double precision atyp(natomax)                                     ! DIST.irp.f:   7
    double precision xx(natomax),yy(natomax),zz(natomax)               ! DIST.irp.f:   8
    double precision ddist(natomax,natomax)                            ! DIST.irp.f:   9
    common /coord/xx,yy,zz,atyp                                        ! DIST.irp.f:  11
    yw=.false.                                                         ! DIST.irp.f:  13
    open(unit=66,status='unknown',file='dist.dat',form='formatted')    ! DIST.irp.f:  15
        write(6,*)'In DIST'                                            ! DIST.irp.f:  20
    if(yw)then                                                         ! DIST.irp.f:  21
    endif                                                              ! DIST.irp.f:  24
    do j=1,atoms                                                       ! DIST.irp.f:  26
        do i=1,j                                                       ! DIST.irp.f:  27
            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) ) ! DIST.irp.f:  29
            if(ddist(j,i).ne.0)then                                    ! DIST.irp.f:  32
                write(6,1000)j-1,i-1,ddist(j,i)                        ! DIST.irp.f:  33
                write(66,1000)j-1,i-1,ddist(j,i)                       ! DIST.irp.f:  34
            endif                                                      ! DIST.irp.f:  35
            if(yw)then                                                 ! DIST.irp.f:  36
                write(6,1000)i,j,ddist(j,i)                            ! DIST.irp.f:  37
                write(66,1000)i,j,ddist(j,i)                           ! DIST.irp.f:  38
            endif                                                      ! DIST.irp.f:  39
        enddo                                                          ! DIST.irp.f:  40
    enddo                                                              ! DIST.irp.f:  41
1000 FORMAT(3x,('R(',I3,',',I3,') = ',F12.4))                          ! DIST.irp.f:  43
end                                                                    ! DIST.irp.f:  45
