        SUBROUTINE MOLDEN(atoms)
        PARAMETER(natomax=20)

        integer atoms
        double precision BTA                ! Bohrs to Angs
        double precision atyp(natomax)
        double precision xx(natomax),yy(natomax),zz(natomax)
        logical :: yw
        character atm

        common /coord/xx,yy,zz,atyp

        yw = .true.
        BTA = 0.529177d0

        open(unit=33,status='new',file='geo.molden',form='formatted')


! ============================================================
! writing molden file in Angs
! ============================================================

!       write(33,*)'[Atoms] Angs'
        write(33,*)'[Atoms] Bohrs'
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

1002 FORMAT(3x,(A,' ',I2,' ',I2,F12.4,F12.4,F12.4))
        end
