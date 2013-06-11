BEGIN_PROVIDER [integer, ngauss]
    implicit none
    BEGIN_DOC
    ! read the basis from file
    END_DOC
    double precision, allocatable :: exp_alpha(:),coeff(:)
    double precision :: order
    integer :: i,n1,n2,N,j
    logical :: is_open

    common /HUCKL/N

    ! check if geo.molden is open and do the nessessary
    inquire(unit=33,opened=is_open)
    if(.not.is_open)then
        open(unit=33,status='new',file='geo.molden',form='formatted')
    endif
    if(basis(1) .eq.'S') then
        print *,'basis=STO-3G'
        open(unit=99,status='old',file='STO-3G')
        read (99,*)ngauss,n1,n2
        allocate (exp_alpha(ngauss))
        allocate (coeff(ngauss))
        order = 1.d0
        do i=1,ngauss
            read(99,*)exp_alpha(i),coeff(i)
        enddo

        write(33,*)'[Molden Format]'
        write(33,*)'[GTO]'
        do j=1,N
            write(33,*)j,'0'
            write(33,*)'p   ',ngauss,' 1.00'
            do i=1,ngauss
                write(33,*)'      ',exp_alpha(i),coeff(i)
            enddo
            write(33,*)
        enddo
    endif
END_PROVIDER
