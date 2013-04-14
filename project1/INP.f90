    SUBROUTINE INP
    PARAMETER(natomax=20)
    COMMON/coord/natom(natomax),x,y,z
    integer atoms
    double precision xx(natomax),yy(natomax),zz(natomax)
    double precision atyp(natomax)
    double precision dist(natomax,natomax)
    logical :: yw

    yw = .false.

    NAMELIST/input/atom,x,y,z

    open(unit=11,status='old',file='geo.inp',form='formatted')
!   open(unit=20,status='new',file='main.out',form='formatted')

    write(6,*)'reading input'
! ============================================================
! reading inputs from .inp
! ============================================================
    read(11,*)atoms;

    write(6,*)'No of atoms: ',atoms
    write(6,*)'coordinates: '
    do j=1,atoms

    read(11,*)atyp(j),xx(j),yy(j),zz(j)

    if(yw)then
        write(6,*)xx(j),yy(j),zz(j)
    endif

    enddo

! ============================================================
! reading inputs from .inp
! ============================================================

    do j=1,atoms
        do i=j,atoms
            dist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) )
            write(6,1000)i,j,dist(j,i)
        enddo
    enddo

1000 FORMAT(3x,('R(',I2,',',I2,')= ',F12.4))
    end
