! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

        SUBROUTINE HUCKEL                                            ! HUCKEL.irp.f:   1
 use atoms_mod                                                       ! HUCKEL.irp.f:  28
  use atoms_mod
  use BETA_mod
  character*(6) :: irp_here = 'huckel'                               ! HUCKEL.irp.f:   1
        PARAMETER(natomax=400)                                       ! HUCKEL.irp.f:   2
        double precision atyp(natomax)                               ! HUCKEL.irp.f:   5
        double precision xx(natomax),yy(natomax),zz(natomax)         ! HUCKEL.irp.f:   6
        double precision ddist(natomax,natomax)                      ! HUCKEL.irp.f:   7
        logical :: yw                                                ! HUCKEL.irp.f:   8
        double precision matH(atoms,atoms)                           ! HUCKEL.irp.f:   9
        integer countH                                               ! HUCKEL.irp.f:  10
          double precision, allocatable :: EVAL(:),EVEC(:,:)         ! HUCKEL.irp.f:  14
          double precision, allocatable :: A(:,:),W(:),WORK(:),AP(:) ! HUCKEL.irp.f:  15
          character*1 JOBZ,UPLO                                      ! HUCKEL.irp.f:  16
          integer N,LDA,LWORK,INFO                                   ! HUCKEL.irp.f:  17
          real*8 K                                                   ! HUCKEL.irp.f:  18
          double precision SUMAA                                     ! HUCKEL.irp.f:  19
        common /coord/xx,yy,zz,atyp                                  ! HUCKEL.irp.f:  23
        common /HUCKL/N                                              ! HUCKEL.irp.f:  25
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
        yw = .true.                                                  ! HUCKEL.irp.f:  27
!                                                                    ! HUCKEL.irp.f:  28
! >>> TOUCH atoms                                                    ! HUCKEL.irp.f:  28
 call touch_atoms                                                    ! HUCKEL.irp.f:  28
! <<< END TOUCH                                                      ! HUCKEL.irp.f:  28
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
        open(unit=44,status='new',file='matH.dat',form='formatted')  ! HUCKEL.irp.f:  30
        open(unit=51,file='eigenval.dat',form='formatted'&
            ,status='new') ! HUCKEL.irp.f:  31
        open(unit=52,file='eigenvec.dat',form='formatted'&
            ,status='new') ! HUCKEL.irp.f:  33
        write(6,*)'In HUCKEL'                                        ! HUCKEL.irp.f:  36
        matH=0d0                                                     ! HUCKEL.irp.f:  41
        countH=0                                                     ! HUCKEL.irp.f:  42
        do i=1,atoms                                                 ! HUCKEL.irp.f:  43
            do j=i,atoms                                             ! HUCKEL.irp.f:  44
            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) ) ! HUCKEL.irp.f:  46
            ddist(i,j)=ddist(j,i)                                    ! HUCKEL.irp.f:  48
                if(atyp(i).eq.6 .and. atyp(j).eq.6)then              ! HUCKEL.irp.f:  49
                    if(ddist(j,i).le.1.6809d0 .and. i.ne.j)then      ! HUCKEL.irp.f:  50
  if (.not.beta_is_built) then
    call provide_beta
  endif
                        matH(j,i)=beta                               ! HUCKEL.irp.f:  51
                        matH(i,j)=matH(j,i)                          ! HUCKEL.irp.f:  52
                    elseif(i.eq.j)then                               ! HUCKEL.irp.f:  53
                        matH(j,i)=0d0                                ! HUCKEL.irp.f:  54
                    endif                                            ! HUCKEL.irp.f:  55
                endif                                                ! HUCKEL.irp.f:  56
            enddo                                                    ! HUCKEL.irp.f:  57
                if(atyp(i).eq.6 )then                                ! HUCKEL.irp.f:  59
                    countH=countH+1                                  ! HUCKEL.irp.f:  60
                endif                                                ! HUCKEL.irp.f:  61
        enddo                                                        ! HUCKEL.irp.f:  62
        do i=1,countH                                                ! HUCKEL.irp.f:  64
        do j=1,countH                                                ! HUCKEL.irp.f:  65
            write(44,1003)matH(i,j)                                  ! HUCKEL.irp.f:  66
        enddo                                                        ! HUCKEL.irp.f:  67
            write(44,*)                                              ! HUCKEL.irp.f:  68
        enddo                                                        ! HUCKEL.irp.f:  69
        N=countH                                                     ! HUCKEL.irp.f:  74
          allocate (A(N,N))                                          ! HUCKEL.irp.f:  76
          allocate (AP(N*N))                                         ! HUCKEL.irp.f:  77
          allocate (W(N))                                            ! HUCKEL.irp.f:  78
          allocate (WORK(N*(2*N)))                                   ! HUCKEL.irp.f:  79
          LDA=N                                                      ! HUCKEL.irp.f:  80
          UPLO='U'                                                   ! HUCKEL.irp.f:  81
          JOBZ='V'                                                   ! HUCKEL.irp.f:  82
          K=0                                                        ! HUCKEL.irp.f:  84
          do j=1,N                                                   ! HUCKEL.irp.f:  85
          do i=1,j                                                   ! HUCKEL.irp.f:  86
            AP(i+(j-1)*j/2)=matH(i,j)                                ! HUCKEL.irp.f:  87
            K=K+1                                                    ! HUCKEL.irp.f:  88
          enddo                                                      ! HUCKEL.irp.f:  89
          enddo                                                      ! HUCKEL.irp.f:  90
          call DSPEV( JOBZ, UPLO, N, AP, W, A, LDA, WORK, INFO)      ! HUCKEL.irp.f:  92
          if (INFO.ne.0)then                                         ! HUCKEL.irp.f:  95
              print*,'Error at dspev'                                ! HUCKEL.irp.f:  96
              call exit(1)                                           ! HUCKEL.irp.f:  97
          endif                                                      ! HUCKEL.irp.f:  98
          do i=1,N                                                   ! HUCKEL.irp.f: 100
            write(51,1022)i,W(i)                                     ! HUCKEL.irp.f: 101
          enddo                                                      ! HUCKEL.irp.f: 102
          do i=1,N                                                   ! HUCKEL.irp.f: 104
            write(52,1022)i,(A(i,j),j=1,N)                           ! HUCKEL.irp.f: 105
          enddo                                                      ! HUCKEL.irp.f: 106
        close(51)                                                    ! HUCKEL.irp.f: 108
        close(52)                                                    ! HUCKEL.irp.f: 109
1003  FORMAT(2X,F12.4,$)                                             ! HUCKEL.irp.f: 111
1022  FORMAT(3x,I5,15(2x,F12.8))                                     ! HUCKEL.irp.f: 112
end                                                                  ! HUCKEL.irp.f: 113
