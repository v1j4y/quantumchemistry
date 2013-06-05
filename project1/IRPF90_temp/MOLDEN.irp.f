        SUBROUTINE MOLDEN
        PARAMETER(natomax=400)

!       integer atoms,N,k
        integer N,k
        double precision BTA                ! Bohrs to Angs
        double precision atyp(natomax)
        double precision xx(natomax),yy(natomax),zz(natomax)
        logical :: yw,is_open
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

        write(6,*)'IN MOLDEN'
        inquire(unit=33,opened=is_open)
        if(.not.is_open)then
            open(unit=33,status='new',file='geo.molden',form='formatted')
        endif
        open(unit=51,status='old',file='eigenval.dat'&
            ,form='formatted')
        open(unit=52,status='old',file='eigenvec.dat'&
            ,form='formatted')

!       write(6,*)'test'
!       print *,'basis=',basis
! ============================================================
! writing molden file in Angs
! ============================================================

!       write(33,*)'[Atoms] Angs'

        write(6,*)N

        touch ngauss
        touch atoms
! ============================================================
! writing basis (only p orbitals)
! ============================================================
        do i=1,N
!           write(33,*)i
!           write(33,*)'p   ',ngauss,' 1.00'
!           write(33,*)'p   3 1.00'
!           write(33,*)'      2.9412494     0.1559162700'
!           write(33,*)'      0.6834831     0.6076837200'
!           write(33,*)'      0.2222899     0.3919573900'

! ============================================================
! STO-6G
! ============================================================
!           write(33,*)'p   6 1.00'
!           write(33,*)'      30.4972395  0.00375970'
!           write(33,*)'       6.0361996  0.03767937'
!           write(33,*)'       1.8760463  0.17389674'
!           write(33,*)'       0.7217826  0.41803643'
!           write(33,*)'       0.3134707  0.42585955'
!           write(33,*)'       0.1436866  0.10170830'

! ============================================================
! 6-31G
! ============================================================
!           write(33,*)'p   4 2  0.00'
!           write(33,*)'     7.86827240  0.06899910  0.00000000'
!           write(33,*)'     1.88128850  0.31642400  0.00000000'
!           write(33,*)'     0.54424930  0.74430830  0.00000000'
!           write(33,*)'     0.16871440  0.00000000  1.00000000'
! ============================================================
! aug-cc-pVDZ
! ============================================================
!           write(33,*)'p   5 3 1.00'
!       write(33,*)'      9.4390000  0.03810900  0.00000000  0.00000000'
!       write(33,*)'      2.0020000  0.20948000  0.00000000  0.00000000'
!       write(33,*)'      0.5456000  0.50855700  0.00000000  0.00000000'
!       write(33,*)'      0.1517000  0.46884200  1.00000000  0.00000000'
!       write(33,*)'      0.0404100  0.00000000  0.00000000  1.00000000'

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
