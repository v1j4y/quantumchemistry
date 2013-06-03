! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

        SUBROUTINE ANGLES                                            ! ANGLES.irp.f:   1
  use atoms_mod
  character*(6) :: irp_here = 'angles'                               ! ANGLES.irp.f:   1
        PARAMETER(natomax=400)                                       ! ANGLES.irp.f:   3
        integer i,j                                                  ! ANGLES.irp.f:   4
        real pi,edote                                                ! ANGLES.irp.f:   5
        double precision atyp(natomax)                               ! ANGLES.irp.f:   6
        double precision ex(natomax,natomax),ey(natomax,natomax),ez(natomax,natomax) ! ANGLES.irp.f:   7
        double precision xx(natomax),yy(natomax),zz(natomax)         ! ANGLES.irp.f:   8
        double precision ddist(natomax,natomax)                      ! ANGLES.irp.f:   9
        double precision theta(natomax,natomax,natomax)              ! ANGLES.irp.f:  10
        logical :: yw                                                ! ANGLES.irp.f:  11
        common /coord/xx,yy,zz,atyp                                  ! ANGLES.irp.f:  13
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
        yw = .true.                                                  ! ANGLES.irp.f:  15
        pi=acos(-1.0)                                                ! ANGLES.irp.f:  17
        ddist=0                                                      ! ANGLES.irp.f:  19
        ex=0                                                         ! ANGLES.irp.f:  20
        ey=0                                                         ! ANGLES.irp.f:  21
        ez=0                                                         ! ANGLES.irp.f:  22
    if(yw)then                                                       ! ANGLES.irp.f:  27
        write(6,*)'In ANGLES'                                        ! ANGLES.irp.f:  28
    endif                                                            ! ANGLES.irp.f:  30
    do j=1,atoms                                                     ! ANGLES.irp.f:  32
        do i=j,atoms                                                 ! ANGLES.irp.f:  33
            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) ) ! ANGLES.irp.f:  35
            ddist(i,j)=ddist(j,i)                                    ! ANGLES.irp.f:  37
            if(ddist(j,i).ne.0.d0)then                               ! ANGLES.irp.f:  39
                ex(j,i)= -(xx(j)-xx(i))/ddist(j,i)                   ! ANGLES.irp.f:  40
                ex(i,j)=ex(j,i)                                      ! ANGLES.irp.f:  41
                ey(j,i)= -(yy(j)-yy(i))/ddist(j,i)                   ! ANGLES.irp.f:  42
                ey(i,j)=ey(j,i)                                      ! ANGLES.irp.f:  43
                ez(j,i)= -(zz(j)-zz(i))/ddist(j,i)                   ! ANGLES.irp.f:  44
                ez(i,j)=ez(j,i)                                      ! ANGLES.irp.f:  45
            endif                                                    ! ANGLES.irp.f:  47
        enddo                                                        ! ANGLES.irp.f:  52
    enddo                                                            ! ANGLES.irp.f:  53
    do j=1,atoms                                                     ! ANGLES.irp.f:  59
        do i=j,atoms                                                 ! ANGLES.irp.f:  60
           if(i.ne.j)then                                            ! ANGLES.irp.f:  61
            do k=i,atoms                                             ! ANGLES.irp.f:  63
             if(k.ne.i .and. k.ne.j)then                             ! ANGLES.irp.f:  64
             if(ddist(j,i).le.4.d0 .and. ddist(i,k).le.4.d0)then     ! ANGLES.irp.f:  66
              edote=acos((ex(j,i)*ex(i,k))+(ey(j,i)*ey(i,k))+(ez(j,i)*ez(i,k))) ! ANGLES.irp.f:  69
              theta(j,i,k)=180.d0 - (180.d0/pi)*edote                ! ANGLES.irp.f:  70
              if(yw)then                                             ! ANGLES.irp.f:  72
                   write(6,1001)j-1,i-1,k-1,theta(j,i,k)             ! ANGLES.irp.f:  73
              endif                                                  ! ANGLES.irp.f:  74
              endif                                                  ! ANGLES.irp.f:  78
             endif                                                   ! ANGLES.irp.f:  80
            enddo                                                    ! ANGLES.irp.f:  82
           endif                                                     ! ANGLES.irp.f:  84
        enddo                                                        ! ANGLES.irp.f:  85
    enddo                                                            ! ANGLES.irp.f:  86
1000 FORMAT(3x,('R(',I3,',',I3,') = ',F12.2))                        ! ANGLES.irp.f:  89
1001 FORMAT(3x,('A(',I3,',',I3,',',I3,') = ',F12.4))                 ! ANGLES.irp.f:  90
end                                                                  ! ANGLES.irp.f:  92
