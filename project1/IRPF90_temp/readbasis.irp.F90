! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

SUBROUTINE readbasis                                              ! readbasis.irp.f:   1
  use basis_mod
    implicit none                                                 ! readbasis.irp.f:   2
  character*(9) :: irp_here = 'readbasis'                         ! readbasis.irp.f:   1
    double precision, allocatable :: exp_alpha(:),coeff(:)        ! readbasis.irp.f:   3
    double precision :: order                                     ! readbasis.irp.f:   4
    integer :: i,n,n1,n2                                          ! readbasis.irp.f:   5
  if (.not.basis_is_built) then
    call provide_basis
  endif
    if(basis(1) .eq.'S') then                                     ! readbasis.irp.f:   6
        print *,'basis=STO-3G'                                    ! readbasis.irp.f:   7
        open(unit=99,status='old',file='STO-3G')                  ! readbasis.irp.f:   8
        read (99,*)n,n1,n2                                        ! readbasis.irp.f:   9
        allocate (exp_alpha(n))                                   ! readbasis.irp.f:  10
        allocate (coeff(n))                                       ! readbasis.irp.f:  11
        order = 1.d0                                              ! readbasis.irp.f:  12
        do i=1,n                                                  ! readbasis.irp.f:  13
            read(99,*)exp_alpha(i),coeff(i)                       ! readbasis.irp.f:  14
        enddo                                                     ! readbasis.irp.f:  15
        do i=1,n                                                  ! readbasis.irp.f:  17
            print *,exp_alpha(i)                                  ! readbasis.irp.f:  18
        enddo                                                     ! readbasis.irp.f:  19
    endif                                                         ! readbasis.irp.f:  20
end                                                               ! readbasis.irp.f:  21
