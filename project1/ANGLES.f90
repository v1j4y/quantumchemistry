    SUBROUTINE ANGLES

        PARAMETER(natomax=20)
        double precision &
        ex(natomax,natomax),ey(natomax,natomax),ez(natomax,natomax)
        double precision ddist(natomax,natomax)
        double precision angle(natomax,natomax)
        logical :: yw

        common/coord/atyp(natomax),atoms,xx(natomax),yy(natomax),zz(natomax)

        yw = .true.

        ddist=0

    do j=1,atoms
        do i=j,atoms
            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) )
            ex(j,i)= -(xx(j)-xx(i))/ddist(j,i)
            ey(j,i)= -(yy(j)-yy(i))/ddist(j,i)
            ez(j,i)= -(zz(j)-zz(i))/ddist(j,i)

            if(yw)then
                write(6,1000)i,j,ddist(j,i)
            endif
        enddo
    enddo

    do j=1,atoms
        do i=1,atoms
            if(ddist(j,i).ne.0.d0)then
                ex(j,i)= -(xx(j)-xx(i))/ddist(j,i)
                ey(j,i)= -(yy(j)-yy(i))/ddist(j,i)
                ez(j,i)= -(zz(j)-zz(i))/ddist(j,i)
            endif
        enddo
    enddo


1000 FORMAT(3x,('R(',I2,',',I2,') = ',F12.4))

    end
