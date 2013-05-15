! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_beta
  use BETA_mod
  implicit none
  character*(12) :: irp_here = 'provide_beta'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
 if (.not.beta_is_built) then
  call bld_beta
  beta_is_built = .True.

 endif
end subroutine provide_beta

subroutine bld_beta
  use BETA_mod
    implicit none                                                      ! BETA.irp.f:   5
  character*(4) :: irp_here = 'beta'                                   ! BETA.irp.f:   1
    beta = 1.0d0                                                       ! BETA.irp.f:   6
end subroutine bld_beta
