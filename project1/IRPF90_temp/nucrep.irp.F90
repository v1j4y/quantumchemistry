! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_enuc
  use nucrep_mod
  implicit none
  character*(12) :: irp_here = 'provide_enuc'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
 if (.not.enuc_is_built) then
  call bld_enuc
  enuc_is_built = .True.

 endif
end subroutine provide_enuc

subroutine bld_enuc
  use nucrep_mod
    implicit none                                                    ! nucrep.irp.f:   5
  character*(4) :: irp_here = 'enuc'                                 ! nucrep.irp.f:   1
    open(unit=991,file="enuc.dat")                                   ! nucrep.irp.f:   6
    read(991,*)enuc                                                  ! nucrep.irp.f:   7
end subroutine bld_enuc
