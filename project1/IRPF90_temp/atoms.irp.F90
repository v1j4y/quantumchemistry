! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_atoms
  use atoms_mod
  implicit none
  character*(13) :: irp_here = 'provide_atoms'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
 if (.not.atoms_is_built) then
  call bld_atoms
  atoms_is_built = .True.

 endif
end subroutine provide_atoms

subroutine bld_atoms
  use atoms_mod
    implicit none                                                     ! atoms.irp.f:   5
  character*(5) :: irp_here = 'atoms'                                 ! atoms.irp.f:   1
    logical :: is_open                                                ! atoms.irp.f:   6
    inquire(unit=11,opened=is_open)                                   ! atoms.irp.f:   7
    if(.not.is_open)then                                              ! atoms.irp.f:   8
        open(unit=11,status='old',file='geo.inp',form='formatted')    ! atoms.irp.f:   9
    endif                                                             ! atoms.irp.f:  10
    read(11,*)atoms                                                   ! atoms.irp.f:  12
end subroutine bld_atoms
