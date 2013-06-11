! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

        SUBROUTINE HUCKEL                                            ! HUCKEL.irp.f:   1
  use atoms_mod
  use BETA_mod
  character*(6) :: irp_here = 'huckel'                               ! HUCKEL.irp.f:   1
        PARAMETER(natomax=400)                                       ! HUCKEL.irp.f:   2
        double precision atyp(natomax)                               ! HUCKEL.irp.f:   4
        double precision xx(natomax),yy(natomax),zz(natomax)         ! HUCKEL.irp.f:   5
        double precision ddist(natomax,natomax)                      ! HUCKEL.irp.f:   6
        logical :: yw                                                ! HUCKEL.irp.f:   7
        double precision matH(atoms,atoms)                           ! HUCKEL.irp.f:   8
        integer countH                                               ! HUCKEL.irp.f:   9
          double precision, allocatable :: EVAL(:),EVEC(:,:)         ! HUCKEL.irp.f:  13
          double precision, allocatable :: A(:,:),W(:),WORK(:),AP(:) ! HUCKEL.irp.f:  14
          character*1 JOBZ,UPLO                                      ! HUCKEL.irp.f:  15
          integer N,LDA,LWORK,INFO                                   ! HUCKEL.irp.f:  16
          real*8 K                                                   ! HUCKEL.irp.f:  17
          double precision SUMAA                                     ! HUCKEL.irp.f:  18
        common /coord/xx,yy,zz,atyp                                  ! HUCKEL.irp.f:  22
        common /HUCKL/N                                              ! HUCKEL.irp.f:  24
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
        yw = .true.                                                  ! HUCKEL.irp.f:  26
        open(unit=44,status='new',file='matH.dat',form='formatted')  ! HUCKEL.irp.f:  28
        open(unit=51,file='eigenval.dat',form='formatted'&
            ,status='new') ! HUCKEL.irp.f:  29
        open(unit=52,file='eigenvec.dat',form='formatted'&
            ,status='new') ! HUCKEL.irp.f:  31
        write(6,*)'In HUCKEL'                                        ! HUCKEL.irp.f:  34
        matH=0d0                                                     ! HUCKEL.irp.f:  39
        countH=0                                                     ! HUCKEL.irp.f:  40
        do i=1,atoms                                                 ! HUCKEL.irp.f:  41
            do j=i,atoms                                             ! HUCKEL.irp.f:  42
            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) ) ! HUCKEL.irp.f:  44
            ddist(i,j)=ddist(j,i)                                    ! HUCKEL.irp.f:  46
                if(atyp(i).eq.6 .and. atyp(j).eq.6)then              ! HUCKEL.irp.f:  47
                    if(ddist(j,i).le.1.6809d0 .and. i.ne.j)then      ! HUCKEL.irp.f:  48
  if (.not.beta_is_built) then
    call provide_beta
  endif
                        matH(j,i)=beta                               ! HUCKEL.irp.f:  49
                        matH(i,j)=matH(j,i)                          ! HUCKEL.irp.f:  50
                    elseif(i.eq.j)then                               ! HUCKEL.irp.f:  51
                        matH(j,i)=0d0                                ! HUCKEL.irp.f:  52
                    endif                                            ! HUCKEL.irp.f:  53
                endif                                                ! HUCKEL.irp.f:  54
            enddo                                                    ! HUCKEL.irp.f:  55
                if(atyp(i).eq.6 )then                                ! HUCKEL.irp.f:  57
                    countH=countH+1                                  ! HUCKEL.irp.f:  58
                endif                                                ! HUCKEL.irp.f:  59
        enddo                                                        ! HUCKEL.irp.f:  60
        do i=1,countH                                                ! HUCKEL.irp.f:  62
        do j=1,countH                                                ! HUCKEL.irp.f:  63
            write(44,1003)matH(i,j)                                  ! HUCKEL.irp.f:  64
        enddo                                                        ! HUCKEL.irp.f:  65
            write(44,*)                                              ! HUCKEL.irp.f:  66
        enddo                                                        ! HUCKEL.irp.f:  67
        N=countH                                                     ! HUCKEL.irp.f:  72
          allocate (A(N,N))                                          ! HUCKEL.irp.f:  74
          allocate (AP(N*N))                                         ! HUCKEL.irp.f:  75
          allocate (W(N))                                            ! HUCKEL.irp.f:  76
          allocate (WORK(N*(2*N)))                                   ! HUCKEL.irp.f:  77
          LDA=N                                                      ! HUCKEL.irp.f:  78
          UPLO='U'                                                   ! HUCKEL.irp.f:  79
          JOBZ='V'                                                   ! HUCKEL.irp.f:  80
          K=0                                                        ! HUCKEL.irp.f:  82
          do j=1,N                                                   ! HUCKEL.irp.f:  83
          do i=1,j                                                   ! HUCKEL.irp.f:  84
            AP(i+(j-1)*j/2)=matH(i,j)                                ! HUCKEL.irp.f:  85
            K=K+1                                                    ! HUCKEL.irp.f:  86
          enddo                                                      ! HUCKEL.irp.f:  87
          enddo                                                      ! HUCKEL.irp.f:  88
          call DSPEV( JOBZ, UPLO, N, AP, W, A, LDA, WORK, INFO)      ! HUCKEL.irp.f:  90
          if (INFO.ne.0)then                                         ! HUCKEL.irp.f:  93
              print*,'Error at dspev'                                ! HUCKEL.irp.f:  94
              call exit(1)                                           ! HUCKEL.irp.f:  95
          endif                                                      ! HUCKEL.irp.f:  96
          do i=1,N                                                   ! HUCKEL.irp.f:  98
            write(51,1022)i,W(i)                                     ! HUCKEL.irp.f:  99
          enddo                                                      ! HUCKEL.irp.f: 100
          do i=1,N                                                   ! HUCKEL.irp.f: 102
            write(52,1022)i,(A(i,j),j=1,N)                           ! HUCKEL.irp.f: 103
          enddo                                                      ! HUCKEL.irp.f: 104
        close(51)                                                    ! HUCKEL.irp.f: 106
        close(52)                                                    ! HUCKEL.irp.f: 107
1003  FORMAT(2X,F12.4,$)                                             ! HUCKEL.irp.f: 109
1022  FORMAT(3x,I5,15(2x,F12.8))                                     ! HUCKEL.irp.f: 110
end                                                                  ! HUCKEL.irp.f: 111
