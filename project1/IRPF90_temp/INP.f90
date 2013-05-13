    SUBROUTINE INP
    PARAMETER(natomax=400)

    integer atoms
    double precision atyp(natomax)
!   double precision xx(natomax),yy(natomax),zz(natomax)
    double precision xx(natomax),yy(natomax),zz(natomax)
!   double precision dist(natomax,natomax)
    logical :: yw

    common /coord/xx,yy,zz,atyp

    yw = .true.

!   NAMELIST/input/atom,x,y,z

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

    call DIST(atoms)
    call ANGLES(atoms)
    call HUCKEL(atoms)
    call MOLDEN(atoms)

    end
