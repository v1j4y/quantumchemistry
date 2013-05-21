! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

subroutine provide_ngauss
  use readbasis_mod
  use basis_mod
  implicit none
  character*(14) :: irp_here = 'provide_ngauss'
  integer                   :: irp_err 
  logical                   :: irp_dimensions_OK
  if (.not.basis_is_built) then
    call provide_basis
  endif
 if (.not.ngauss_is_built) then
  call bld_ngauss
  ngauss_is_built = .True.

 endif
end subroutine provide_ngauss

subroutine bld_ngauss
  use readbasis_mod
  use basis_mod
    implicit none                                                 ! readbasis.irp.f:   2
  character*(6) :: irp_here = 'ngauss'                            ! readbasis.irp.f:   1
    double precision, allocatable :: exp_alpha(:),coeff(:)        ! readbasis.irp.f:   6
    double precision :: order                                     ! readbasis.irp.f:   7
    integer :: i,n1,n2,N,j                                        ! readbasis.irp.f:   8
    logical :: is_open                                            ! readbasis.irp.f:   9
    common /HUCKL/N                                               ! readbasis.irp.f:  11
    inquire(unit=33,opened=is_open)                               ! readbasis.irp.f:  14
    if(.not.is_open)then                                          ! readbasis.irp.f:  15
        open(unit=33,status='new',file='geo.molden',form='formatted') ! readbasis.irp.f:  16
    endif                                                         ! readbasis.irp.f:  17
    if(basis(1) .eq.'S') then                                     ! readbasis.irp.f:  18
        print *,'basis=STO-3G'                                    ! readbasis.irp.f:  19
        open(unit=99,status='old',file='STO-3G')                  ! readbasis.irp.f:  20
        read (99,*)ngauss,n1,n2                                   ! readbasis.irp.f:  21
        allocate (exp_alpha(ngauss))                              ! readbasis.irp.f:  22
        allocate (coeff(ngauss))                                  ! readbasis.irp.f:  23
        order = 1.d0                                              ! readbasis.irp.f:  24
        do i=1,ngauss                                             ! readbasis.irp.f:  25
            read(99,*)exp_alpha(i),coeff(i)                       ! readbasis.irp.f:  26
        enddo                                                     ! readbasis.irp.f:  27
        write(33,*)'[Molden Format]'                              ! readbasis.irp.f:  29
        write(33,*)'[GTO]'                                        ! readbasis.irp.f:  30
        do j=1,N                                                  ! readbasis.irp.f:  31
            write(33,*)j,'0'                                      ! readbasis.irp.f:  32
            write(33,*)'p   ',ngauss,' 1.00'                      ! readbasis.irp.f:  33
            do i=1,ngauss                                         ! readbasis.irp.f:  34
                write(33,*)'      ',exp_alpha(i),coeff(i)         ! readbasis.irp.f:  35
            enddo                                                 ! readbasis.irp.f:  36
            write(33,*)                                           ! readbasis.irp.f:  37
        enddo                                                     ! readbasis.irp.f:  38
    endif                                                         ! readbasis.irp.f:  39
end subroutine bld_ngauss
