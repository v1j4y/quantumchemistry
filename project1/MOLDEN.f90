        SUBROUTINE MOLDEN(atoms)
        PARAMETER(natomax=400)

        integer atoms,N,k
        double precision BTA                ! Bohrs to Angs
        double precision atyp(natomax)
        double precision xx(natomax),yy(natomax),zz(natomax)
        logical :: yw
        character atm
        double precision, allocatable :: EVAL(:),EVEC(:,:)

        common /coord/xx,yy,zz,atyp

        common /HUCKL/N

        yw = .true.
!       BTA = 0.529177d0
        BTA = 1.000000d0
        k=0

        allocate (EVAL(N))
        allocate (EVEC(N,N))

        open(unit=33,status='new',file='geo.molden',form='formatted')
        open(unit=51,status='old',file='eigenval.dat'&
            ,form='formatted')
        open(unit=52,status='old',file='eigenvec.dat'&
            ,form='formatted')


! ============================================================
! writing molden file in Angs
! ============================================================

!       write(33,*)'[Atoms] Angs'

        write(6,*)N

        write(33,*)'[Molden Format]'
        write(33,*)'[GTO]'
! ============================================================
! writing basis (only p orbitals)
! ============================================================
        do i=1,N
            write(33,*)i
            write(33,*)'p 3 1.00'
            write(33,*)'   5.0331513 0.1559162700'
            write(33,*)'   1.1695961 0.6076837200'
            write(33,*)'   0.3803890 0.3919573900'
        enddo
        write(33,*)'[MO]'
        do i=1,N
            read(51,*)j,EVAL(i)
        enddo

        do i=1,N
            read(52,*)j,(EVEC(i,j),j=1,N)
        enddo

        do i=1,N
            write(33,*)'Ene=',(1d0*EVAL(i))
            write(33,*)'Spin= Alpha'
            if(i.le.N/2)then
                write(33,*)'Occup= 2.000'
            else
                write(33,*)'Occup= 0.000'
            endif

            do j=1,3*N
                if(j-(INT(j/3)*3).eq.0)then
                    k=k+1
                    write(33,*)j,(EVEC(k,i)*01.d0)
                else
                    write(33,*)j,'0.00000000'
                endif
            enddo
            k=0
        enddo


        write(33,*)'[Atoms] Angs'
        do i=1,atoms
            if(atyp(i).eq.1)then
                atm='H'
!               write(atm,*)'H'
            elseif(atyp(i).eq.6)then
                atm='C'
            elseif(atyp(i).eq.8)then
                atm='O'
            endif
            write(33,1002)atm,i,INT(atyp(i)) &
                ,xx(i)*BTA,yy(i)*BTA,zz(i)*BTA
        enddo

1002 FORMAT(3x,(A,' ',I3,' ',I3,F12.4,F12.4,F12.4))
        end
