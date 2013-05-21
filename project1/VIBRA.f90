    subroutine VIBRA(atoms)
    
        PARAMETER(natomax=20)

        integer atoms,atomsH
        double precision atyp(natomax)
        double precision ex(natomax,natomax),ey(natomax,natomax),ez(natomax,natomax)
        double precision xx(natomax),yy(natomax),zz(natomax)
        double precision fx(natomax),fy(natomax),fz(natomax)
        double precision ddist(natomax,natomax)
        double precision theta(natomax,natomax,natomax)
        logical :: yw

        common /coord/xx,yy,zz,atyp

        yw = .true.

        open(unit=22,status='old',file='hessian.inp',form='formatted')

        pi=acos(-1.0)
!       write(6,*)pi
        ddist=0
        ex=0
        ey=0
        ez=0

! ============================================================
! calculating the Hessian
! ============================================================
        if(yw)then
            write(6,*)'In VIBRA'
!           write(6,*)atoms
        endif

        read(22,*)atomsH

        if(atoms.ne.atomsH)then
            write(6,*)'Error! : Number of atoms do not match'
            goto 999
        endif
        
        do j=1,atomsH
            read(22,*)fx(j),fy(j),fz(j)

            if(yw)then
                write(6,*)xx(j),yy(j),zz(j)
            endif

        enddo

999     end
