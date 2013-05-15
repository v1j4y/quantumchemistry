SUBROUTINE readbasis
    implicit none
    double precision, allocatable :: exp_alpha(:),coeff(:)
    double precision :: order
    integer :: i,n,n1,n2
    if(basis(1) .eq.'S') then
        print *,'basis=STO-3G'
        open(unit=99,status='old',file='STO-3G')
        read (99,*)n,n1,n2
        allocate (exp_alpha(n))
        allocate (coeff(n))
        order = 1.d0
        do i=1,n
            read(99,*)exp_alpha(i),coeff(i)
        enddo

        do i=1,n
            print *,exp_alpha(i)
        enddo
    endif
end
