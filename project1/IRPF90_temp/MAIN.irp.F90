! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

program irp_program                                                    ! main:   0
 call main                                                             ! MAIN.irp.f:   0
 call irp_finalize_1733191211()                                        ! MAIN.irp.f:   0
end program                                                            ! MAIN.irp.f:   0
subroutine main                                                        ! MAIN.irp.f:   1
  character*(4) :: irp_here = 'main'                                   ! MAIN.irp.f:   1
    PARAMETER (natomax=20)                                             ! MAIN.irp.f:   2
    double precision xx(natomax),yy(natomax),zz(natomax)               ! MAIN.irp.f:   3
    common /coord/xx,yy,zz                                             ! MAIN.irp.f:   5
      write(6,*)'@@@@@@@@  @@@@@@@ @@@@@@@   @@@@@@@@ @@@@@@@  @ '     ! MAIN.irp.f:   8
      write(6,*)'               start'                                 ! MAIN.irp.f:   9
      write(6,*)'@@@@@@@@  @@@@@@@ @@@@@@@   @@@@@@@@ @@@@@@@  @ '     ! MAIN.irp.f:  10
    call INP                                                           ! MAIN.irp.f:  11
end                                                                    ! MAIN.irp.f:  15
