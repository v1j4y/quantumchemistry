! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

        SUBROUTINE MOLDEN                                            ! MOLDEN.irp.f:   1
  use atoms_mod
  character*(6) :: irp_here = 'molden'                               ! MOLDEN.irp.f:   1
        PARAMETER(natomax=400)                                       ! MOLDEN.irp.f:   2
        integer N,k                                                  ! MOLDEN.irp.f:   4
        double precision BTA                                         ! MOLDEN.irp.f:   5
        double precision atyp(natomax)                               ! MOLDEN.irp.f:   6
        double precision xx(natomax),yy(natomax),zz(natomax)         ! MOLDEN.irp.f:   7
        logical :: yw,is_open                                        ! MOLDEN.irp.f:   8
        character atm                                                ! MOLDEN.irp.f:   9
        double precision, allocatable :: EVAL(:),EVEC(:,:)           ! MOLDEN.irp.f:  10
        common /coord/xx,yy,zz,atyp                                  ! MOLDEN.irp.f:  12
        common /HUCKL/N                                              ! MOLDEN.irp.f:  14
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
        yw = .true.                                                  ! MOLDEN.irp.f:  16
        BTA = 1.000000d0                                             ! MOLDEN.irp.f:  18
        k=0                                                          ! MOLDEN.irp.f:  19
        allocate (EVAL(N))                                           ! MOLDEN.irp.f:  21
        allocate (EVEC(N,N))                                         ! MOLDEN.irp.f:  22
        write(6,*)'IN MOLDEN'                                        ! MOLDEN.irp.f:  24
        inquire(unit=33,opened=is_open)                              ! MOLDEN.irp.f:  25
        if(.not.is_open)then                                         ! MOLDEN.irp.f:  26
            open(unit=33,status='new',file='geo.molden',form='formatted') ! MOLDEN.irp.f:  27
        endif                                                        ! MOLDEN.irp.f:  28
        write(33,*)'[Molden Format]'                                 ! MOLDEN.irp.f:  29
        write(33,*)'[GTO]'                                           ! MOLDEN.irp.f:  30
        write(33,*)''                                                ! MOLDEN.irp.f:  31
        open(unit=51,status='old',file='eigenval.dat'&
            ,form='formatted') ! MOLDEN.irp.f:  32
        open(unit=52,status='old',file='eigenvec.dat'&
            ,form='formatted') ! MOLDEN.irp.f:  34
        write(6,*)N                                                  ! MOLDEN.irp.f:  45
        do i=1,N                                                     ! MOLDEN.irp.f:  50
        enddo                                                        ! MOLDEN.irp.f:  87
        write(33,*)'[MO]'                                            ! MOLDEN.irp.f:  88
        do i=1,N                                                     ! MOLDEN.irp.f:  89
            read(51,*)j,EVAL(i)                                      ! MOLDEN.irp.f:  90
        enddo                                                        ! MOLDEN.irp.f:  91
        do i=1,N                                                     ! MOLDEN.irp.f:  93
            read(52,*)j,(EVEC(i,j),j=1,N)                            ! MOLDEN.irp.f:  94
        enddo                                                        ! MOLDEN.irp.f:  95
        do i=1,N                                                     ! MOLDEN.irp.f:  97
            write(33,*)'Ene=',(1d0*EVAL(i))                          ! MOLDEN.irp.f:  98
            write(33,*)'Spin= Alpha'                                 ! MOLDEN.irp.f:  99
            if(i.le.N/2)then                                         ! MOLDEN.irp.f: 100
                write(33,*)'Occup= 2.000'                            ! MOLDEN.irp.f: 101
            else                                                     ! MOLDEN.irp.f: 102
                write(33,*)'Occup= 0.000'                            ! MOLDEN.irp.f: 103
            endif                                                    ! MOLDEN.irp.f: 104
            do j=1,3*N                                               ! MOLDEN.irp.f: 106
                if(j-(INT(j/3)*3).eq.0)then                          ! MOLDEN.irp.f: 107
                    k=k+1                                            ! MOLDEN.irp.f: 108
                    write(33,*)j,(EVEC(k,i)*01.d0)                   ! MOLDEN.irp.f: 109
                else                                                 ! MOLDEN.irp.f: 110
                    write(33,*)j,'0.00000000'                        ! MOLDEN.irp.f: 111
                endif                                                ! MOLDEN.irp.f: 112
            enddo                                                    ! MOLDEN.irp.f: 113
            k=0                                                      ! MOLDEN.irp.f: 114
        enddo                                                        ! MOLDEN.irp.f: 115
        write(33,*)'[Atoms] Angs'                                    ! MOLDEN.irp.f: 118
        do i=1,atoms                                                 ! MOLDEN.irp.f: 119
            if(atyp(i).eq.1)then                                     ! MOLDEN.irp.f: 120
                atm='H'                                              ! MOLDEN.irp.f: 121
            elseif(atyp(i).eq.6)then                                 ! MOLDEN.irp.f: 123
                atm='C'                                              ! MOLDEN.irp.f: 124
            elseif(atyp(i).eq.8)then                                 ! MOLDEN.irp.f: 125
                atm='O'                                              ! MOLDEN.irp.f: 126
            endif                                                    ! MOLDEN.irp.f: 127
            write(33,1002)atm,i,INT(atyp(i)) &
                ,xx(i)*BTA,yy(i)*BTA,zz(i)*BTA ! MOLDEN.irp.f: 128
        enddo                                                        ! MOLDEN.irp.f: 130
1002 FORMAT(3x,(A,' ',I3,' ',I3,F12.4,F12.4,F12.4))                  ! MOLDEN.irp.f: 132
end                                                                  ! MOLDEN.irp.f: 133
