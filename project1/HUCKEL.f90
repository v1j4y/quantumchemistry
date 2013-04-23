        SUBROUTINE HUCKEL(atoms)
        PARAMETER(natomax=40)

        integer atoms
        double precision atyp(natomax)
        double precision xx(natomax),yy(natomax),zz(natomax)
        double precision ddist(natomax,natomax)
        logical :: yw
        double precision matH(atoms,atoms)
        integer countH

! ============================================================

          double precision, allocatable :: EVAL(:),EVEC(:,:)
          double precision, allocatable :: A(:,:),W(:),WORK(:),AP(:)
          character*1 JOBZ,UPLO
          integer N,LDA,LWORK,INFO
          real*8 K
          double precision SUMAA

! ============================================================
!
        common /coord/xx,yy,zz,atyp

        common /HUCKL/N

        yw = .true.

        open(unit=44,status='new',file='matH.dat',form='formatted')
        open(unit=51,file='eigenval.dat',form='formatted'&
            ,status='new')
        open(unit=52,file='eigenvec.dat',form='formatted'&
            ,status='new')

        write(6,*)'In HUCKEL'
! ============================================================
! do a hueckel according to the distance
! ============================================================

        matH=0d0
        countH=0
        do i=1,atoms
            do j=i,atoms

            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) )
            ddist(i,j)=ddist(j,i)
                if(atyp(i).eq.6 .and. atyp(j).eq.6)then
                    if(ddist(j,i).le.1.6199d0 .and. i.ne.j)then
                        matH(j,i)=1.d0
                        matH(i,j)=matH(j,i)
                    elseif(i.eq.j)then
                        matH(j,i)=0d0
                    endif
                endif
            enddo
!           write(6,1025)i,(matH(k,i),k=1,atoms)
                if(atyp(i).eq.6 )then
                    countH=countH+1
                endif
        enddo

        do i=1,countH
        do j=1,countH
            write(44,1003)matH(i,j)
        enddo
            write(44,*)
        enddo

! ============================================================
! Diagonalizing dspev
! ============================================================
        N=countH

          allocate (A(N,N))
          allocate (AP(N*N))
          allocate (W(N))
          allocate (WORK(N*(2*N)))
          LDA=N
          UPLO='U'
          JOBZ='V'

          K=0
          do j=1,N
          do i=1,j
            AP(i+(j-1)*j/2)=matH(i,j)
            K=K+1
          enddo
          enddo

          call DSPEV( JOBZ, UPLO, N, AP, W, A, LDA, WORK, INFO)
!         write(6,*)INFO

          if (INFO.ne.0)then
              print*,'Error at dspev'
              call exit(1)
          endif

          do i=1,N
            write(51,1022)i,W(i)
          enddo

          do i=1,N
            write(52,1022)i,(A(i,j),j=1,N)
          enddo

        close(51)
        close(52)

1003  FORMAT(2X,F12.4,$)
1022  FORMAT(3x,I5,15(2x,F12.8))
        end

