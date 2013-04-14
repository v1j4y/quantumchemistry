    PROGRAM MAIN
    PARAMETER (natomax=20)
!   common/coord/natom(natomax),x,y,z
    common /coord/atyp,atoms,xx(natomax),yy(natomax),zz(natomax)

      write(6,*)'@@@@@@@@  @@@@@@@ @@@@@@@   @@@@@@@@ @@@@@@@  @ '
      write(6,*)'               start'
      write(6,*)'@@@@@@@@  @@@@@@@ @@@@@@@   @@@@@@@@ @@@@@@@  @ '
    call INP
    call DIST
    call ANGLES

    end
