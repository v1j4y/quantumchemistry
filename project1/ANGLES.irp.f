        SUBROUTINE ANGLES

        PARAMETER(natomax=400)
        integer i,j
        real pi,edote
        double precision atyp(natomax)
        double precision ex(natomax,natomax),ey(natomax,natomax),ez(natomax,natomax)
        double precision xx(natomax),yy(natomax),zz(natomax)
        double precision ddist(natomax,natomax)
        double precision theta(natomax,natomax,natomax)
        logical :: yw

        common /coord/xx,yy,zz,atyp

        yw = .true.

        pi=acos(-1.0)
!       write(6,*)pi
        ddist=0
        ex=0
        ey=0
        ez=0

! ============================================================
! calculating all possible angles
! ============================================================
    if(yw)then
        write(6,*)'In ANGLES'
!       write(6,*)atoms
    endif

    do j=1,atoms
        do i=j,atoms

            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) )
            ddist(i,j)=ddist(j,i)

            if(ddist(j,i).ne.0.d0)then
                ex(j,i)= -(xx(j)-xx(i))/ddist(j,i)
                ex(i,j)=ex(j,i)
                ey(j,i)= -(yy(j)-yy(i))/ddist(j,i)
                ey(i,j)=ey(j,i)
                ez(j,i)= -(zz(j)-zz(i))/ddist(j,i)
                ez(i,j)=ez(j,i)
!               write(6,*)ex(j,i)
            endif

!           if(yw)then
!               write(6,1000)i,j,ddist(j,i)
!           endif
        enddo
    enddo

!   write(6,*)'test'
!   write(6,*)ex(1,2)
!

    do j=1,atoms
        do i=j,atoms
           if(i.ne.j)then

            do k=i,atoms
             if(k.ne.i .and. k.ne.j)then

             if(ddist(j,i).le.4.d0 .and. ddist(i,k).le.4.d0)then
                 ! only calculate angles if bond length is <= 5.0

              edote=acos((ex(j,i)*ex(i,k))+(ey(j,i)*ey(i,k))+(ez(j,i)*ez(i,k)))
              theta(j,i,k)=180.d0 - (180.d0/pi)*edote

              if(yw)then
                   write(6,1001)j-1,i-1,k-1,theta(j,i,k)
              endif

!             write(6,*)ddist(i,k),i-1,k-1

              endif

             endif

            enddo

           endif
        enddo
    enddo


1000 FORMAT(3x,('R(',I3,',',I3,') = ',F12.2))
1001 FORMAT(3x,('A(',I3,',',I3,',',I3,') = ',F12.4))

    end
