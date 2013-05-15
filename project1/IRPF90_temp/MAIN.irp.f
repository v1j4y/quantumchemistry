    PROGRAM MAIN
    PARAMETER (natomax=20)
    double precision xx(natomax),yy(natomax),zz(natomax)
!   common/coord/natom(natomax),x,y,z
    common /coord/xx,yy,zz
    common /attype/atoms,atype

      write(6,*)'@@@@@@@@  @@@@@@@ @@@@@@@   @@@@@@@@ @@@@@@@  @ '
      write(6,*)'               start'
      write(6,*)'@@@@@@@@  @@@@@@@ @@@@@@@   @@@@@@@@ @@@@@@@  @ '
    call INP
!   call DIST
!   call ANGLES

    end
