! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

        SUBROUTINE MOLDEN(atoms)                                     ! MOLDEN.irp.f:   1
  character*(6) :: irp_here = 'molden'                               ! MOLDEN.irp.f:   1
        PARAMETER(natomax=400)                                       ! MOLDEN.irp.f:   2
        integer atoms,N,k                                            ! MOLDEN.irp.f:   4
        double precision BTA                                         ! MOLDEN.irp.f:   5
        double precision atyp(natomax)                               ! MOLDEN.irp.f:   6
        double precision xx(natomax),yy(natomax),zz(natomax)         ! MOLDEN.irp.f:   7
        logical :: yw                                                ! MOLDEN.irp.f:   8
        character atm                                                ! MOLDEN.irp.f:   9
        double precision, allocatable :: EVAL(:),EVEC(:,:)           ! MOLDEN.irp.f:  10
        common /coord/xx,yy,zz,atyp                                  ! MOLDEN.irp.f:  12
        common /HUCKL/N                                              ! MOLDEN.irp.f:  14
        yw = .true.                                                  ! MOLDEN.irp.f:  16
        BTA = 1.000000d0                                             ! MOLDEN.irp.f:  18
        k=0                                                          ! MOLDEN.irp.f:  19
        allocate (EVAL(N))                                           ! MOLDEN.irp.f:  21
        allocate (EVEC(N,N))                                         ! MOLDEN.irp.f:  22
        write(6,*)'IN MOLDEN'                                        ! MOLDEN.irp.f:  24
        open(unit=33,status='new',file='geo.molden',form='formatted') ! MOLDEN.irp.f:  25
        open(unit=51,status='old',file='eigenval.dat'&
            ,form='formatted') ! MOLDEN.irp.f:  26
        open(unit=52,status='old',file='eigenvec.dat'&
            ,form='formatted') ! MOLDEN.irp.f:  28
        call readbasis                                               ! MOLDEN.irp.f:  33
        write(6,*)N                                                  ! MOLDEN.irp.f:  40
        write(33,*)'[Molden Format]'                                 ! MOLDEN.irp.f:  42
        write(33,*)'[GTO]'                                           ! MOLDEN.irp.f:  43
        do i=1,N                                                     ! MOLDEN.irp.f:  47
            write(33,*)i                                             ! MOLDEN.irp.f:  48
            write(33,*)'p   5 3 1.00'                                ! MOLDEN.irp.f:  76
        write(33,*)'      9.4390000  0.03810900  0.00000000  0.00000000' ! MOLDEN.irp.f:  77
        write(33,*)'      2.0020000  0.20948000  0.00000000  0.00000000' ! MOLDEN.irp.f:  78
        write(33,*)'      0.5456000  0.50855700  0.00000000  0.00000000' ! MOLDEN.irp.f:  79
        write(33,*)'      0.1517000  0.46884200  1.00000000  0.00000000' ! MOLDEN.irp.f:  80
        write(33,*)'      0.0404100  0.00000000  0.00000000  1.00000000' ! MOLDEN.irp.f:  81
        enddo                                                        ! MOLDEN.irp.f:  83
        write(33,*)'[MO]'                                            ! MOLDEN.irp.f:  84
        do i=1,N                                                     ! MOLDEN.irp.f:  85
            read(51,*)j,EVAL(i)                                      ! MOLDEN.irp.f:  86
        enddo                                                        ! MOLDEN.irp.f:  87
        do i=1,N                                                     ! MOLDEN.irp.f:  89
            read(52,*)j,(EVEC(i,j),j=1,N)                            ! MOLDEN.irp.f:  90
        enddo                                                        ! MOLDEN.irp.f:  91
        do i=1,N                                                     ! MOLDEN.irp.f:  93
            write(33,*)'Ene=',(1d0*EVAL(i))                          ! MOLDEN.irp.f:  94
            write(33,*)'Spin= Alpha'                                 ! MOLDEN.irp.f:  95
            if(i.le.N/2)then                                         ! MOLDEN.irp.f:  96
                write(33,*)'Occup= 2.000'                            ! MOLDEN.irp.f:  97
            else                                                     ! MOLDEN.irp.f:  98
                write(33,*)'Occup= 0.000'                            ! MOLDEN.irp.f:  99
            endif                                                    ! MOLDEN.irp.f: 100
            do j=1,3*N                                               ! MOLDEN.irp.f: 102
                if(j-(INT(j/3)*3).eq.0)then                          ! MOLDEN.irp.f: 103
                    k=k+1                                            ! MOLDEN.irp.f: 104
                    write(33,*)j,(EVEC(k,i)*01.d0)                   ! MOLDEN.irp.f: 105
                else                                                 ! MOLDEN.irp.f: 106
                    write(33,*)j,'0.00000000'                        ! MOLDEN.irp.f: 107
                endif                                                ! MOLDEN.irp.f: 108
            enddo                                                    ! MOLDEN.irp.f: 109
            k=0                                                      ! MOLDEN.irp.f: 110
        enddo                                                        ! MOLDEN.irp.f: 111
        write(33,*)'[Atoms] Angs'                                    ! MOLDEN.irp.f: 114
        do i=1,atoms                                                 ! MOLDEN.irp.f: 115
            if(atyp(i).eq.1)then                                     ! MOLDEN.irp.f: 116
                atm='H'                                              ! MOLDEN.irp.f: 117
            elseif(atyp(i).eq.6)then                                 ! MOLDEN.irp.f: 119
                atm='C'                                              ! MOLDEN.irp.f: 120
            elseif(atyp(i).eq.8)then                                 ! MOLDEN.irp.f: 121
                atm='O'                                              ! MOLDEN.irp.f: 122
            endif                                                    ! MOLDEN.irp.f: 123
            write(33,1002)atm,i,INT(atyp(i)) &
                ,xx(i)*BTA,yy(i)*BTA,zz(i)*BTA ! MOLDEN.irp.f: 124
        enddo                                                        ! MOLDEN.irp.f: 126
1002 FORMAT(3x,(A,' ',I3,' ',I3,F12.4,F12.4,F12.4))                  ! MOLDEN.irp.f: 128
end                                                                  ! MOLDEN.irp.f: 129
