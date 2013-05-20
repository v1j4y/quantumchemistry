! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

program irp_program                                                    ! test:   0
 call test                                                             ! test.irp.f:   0
 call irp_finalize_1733191211()                                        ! test.irp.f:   0
end program                                                            ! test.irp.f:   0
subroutine test                                                        ! test.irp.f:   1
  use nucrep_mod
  use basis_mod
    implicit none                                                      ! test.irp.f:   2
  character*(4) :: irp_here = 'test'                                   ! test.irp.f:   1
  if (.not.enuc_is_built) then
    call provide_enuc
  endif
  if (.not.basis_is_built) then
    call provide_basis
  endif
    print *, 'basis=',basis                                            ! test.irp.f:   3
    print *, enuc                                                      ! test.irp.f:   4
end                                                                    ! test.irp.f:   5
