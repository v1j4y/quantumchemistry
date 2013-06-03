! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_basis
  use atoms_mod
  use basis_mod
  implicit none
  character*(13) :: irp_here = 'provide_basis'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
 if (allocated (basis) ) then
  irp_dimensions_OK = .True.
  irp_dimensions_OK = irp_dimensions_OK.AND.(SIZE(basis,1)==(1))
  if (.not.irp_dimensions_OK) then
   deallocate(basis,stat=irp_err)
   if (irp_err /= 0) then
     print *, irp_here//': Deallocation failed: basis'
     print *, ' size: (1)'
   endif
   if ((1>0)) then
    allocate(basis(1),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: basis'
     print *, ' size: (1)'
    endif
   endif
  endif
 else
   if ((1>0)) then
    allocate(basis(1),stat=irp_err)
    if (irp_err /= 0) then
     print *, irp_here//': Allocation failed: basis'
     print *, ' size: (1)'
    endif
   endif
 endif
 if (.not.basis_is_built) then
  call bld_basis
  basis_is_built = .True.

 endif
end subroutine provide_basis

subroutine bld_basis
  use atoms_mod
  use basis_mod
    implicit none                                                     ! basis.irp.f:   5
  character*(5) :: irp_here = 'basis'                                 ! basis.irp.f:   1
    print *,'basis?'                                                  ! basis.irp.f:   7
    basis='S'                                                         ! basis.irp.f:   8
    print *, 'atoms',atoms                                            ! basis.irp.f:   9
end subroutine bld_basis
