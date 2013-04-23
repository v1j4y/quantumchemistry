    SUBROUTINE DIST(atoms)
    PARAMETER(natomax=40)

    logical :: yw
    integer i,j
    integer atoms
    double precision atyp(natomax)
    double precision xx(natomax),yy(natomax),zz(natomax)
    double precision ddist(natomax,natomax)

    common /coord/xx,yy,zz,atyp

    yw=.false.

    open(unit=66,status='new',file='dist.dat',form='formatted')

! ============================================================
! calculating distances R_ij
! ============================================================
        write(6,*)'In DIST'
    if(yw)then
!       write(6,*)atoms
!       write(6,*)xx(2)
    endif

    do j=1,atoms
        do i=1,j

            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) )

            if(ddist(j,i).ne.0)then
                write(6,1000)j-1,i-1,ddist(j,i)
                write(66,1000)j-1,i-1,ddist(j,i)
            endif
            if(yw)then
                write(6,1000)i,j,ddist(j,i)
                write(66,1000)i,j,ddist(j,i)
            endif
        enddo
    enddo

1000 FORMAT(3x,('R(',I2,',',I2,') = ',F12.4))

    end
