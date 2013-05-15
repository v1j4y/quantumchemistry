! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

        SUBROUTINE ANGLES(atoms)                                     ! ANGLES.irp.f:   1
  character*(6) :: irp_here = 'angles'                               ! ANGLES.irp.f:   1
        PARAMETER(natomax=400)                                       ! ANGLES.irp.f:   3
        integer i,j                                                  ! ANGLES.irp.f:   4
        integer atoms                                                ! ANGLES.irp.f:   5
        real pi,edote                                                ! ANGLES.irp.f:   6
        double precision atyp(natomax)                               ! ANGLES.irp.f:   7
        double precision ex(natomax,natomax),ey(natomax,natomax),ez(natomax,natomax) ! ANGLES.irp.f:   8
        double precision xx(natomax),yy(natomax),zz(natomax)         ! ANGLES.irp.f:   9
        double precision ddist(natomax,natomax)                      ! ANGLES.irp.f:  10
        double precision theta(natomax,natomax,natomax)              ! ANGLES.irp.f:  11
        logical :: yw                                                ! ANGLES.irp.f:  12
        common /coord/xx,yy,zz,atyp                                  ! ANGLES.irp.f:  14
        yw = .true.                                                  ! ANGLES.irp.f:  16
        pi=acos(-1.0)                                                ! ANGLES.irp.f:  18
        ddist=0                                                      ! ANGLES.irp.f:  20
        ex=0                                                         ! ANGLES.irp.f:  21
        ey=0                                                         ! ANGLES.irp.f:  22
        ez=0                                                         ! ANGLES.irp.f:  23
    if(yw)then                                                       ! ANGLES.irp.f:  28
        write(6,*)'In ANGLES'                                        ! ANGLES.irp.f:  29
    endif                                                            ! ANGLES.irp.f:  31
    do j=1,atoms                                                     ! ANGLES.irp.f:  33
        do i=j,atoms                                                 ! ANGLES.irp.f:  34
            ddist(j,i)=sqrt( ((xx(i)-xx(j))**2) + ((yy(i)-yy(j))**2) &
                        + ((zz(i)-zz(j))**2) ) ! ANGLES.irp.f:  36
            ddist(i,j)=ddist(j,i)                                    ! ANGLES.irp.f:  38
            if(ddist(j,i).ne.0.d0)then                               ! ANGLES.irp.f:  40
                ex(j,i)= -(xx(j)-xx(i))/ddist(j,i)                   ! ANGLES.irp.f:  41
                ex(i,j)=ex(j,i)                                      ! ANGLES.irp.f:  42
                ey(j,i)= -(yy(j)-yy(i))/ddist(j,i)                   ! ANGLES.irp.f:  43
                ey(i,j)=ey(j,i)                                      ! ANGLES.irp.f:  44
                ez(j,i)= -(zz(j)-zz(i))/ddist(j,i)                   ! ANGLES.irp.f:  45
                ez(i,j)=ez(j,i)                                      ! ANGLES.irp.f:  46
            endif                                                    ! ANGLES.irp.f:  48
        enddo                                                        ! ANGLES.irp.f:  53
    enddo                                                            ! ANGLES.irp.f:  54
    do j=1,atoms                                                     ! ANGLES.irp.f:  60
        do i=j,atoms                                                 ! ANGLES.irp.f:  61
           if(i.ne.j)then                                            ! ANGLES.irp.f:  62
            do k=i,atoms                                             ! ANGLES.irp.f:  64
             if(k.ne.i .and. k.ne.j)then                             ! ANGLES.irp.f:  65
             if(ddist(j,i).le.4.d0 .and. ddist(i,k).le.4.d0)then     ! ANGLES.irp.f:  67
              edote=acos((ex(j,i)*ex(i,k))+(ey(j,i)*ey(i,k))+(ez(j,i)*ez(i,k))) ! ANGLES.irp.f:  70
              theta(j,i,k)=180.d0 - (180.d0/pi)*edote                ! ANGLES.irp.f:  71
              if(yw)then                                             ! ANGLES.irp.f:  73
                   write(6,1001)j-1,i-1,k-1,theta(j,i,k)             ! ANGLES.irp.f:  74
              endif                                                  ! ANGLES.irp.f:  75
              endif                                                  ! ANGLES.irp.f:  79
             endif                                                   ! ANGLES.irp.f:  81
            enddo                                                    ! ANGLES.irp.f:  83
           endif                                                     ! ANGLES.irp.f:  85
        enddo                                                        ! ANGLES.irp.f:  86
    enddo                                                            ! ANGLES.irp.f:  87
1000 FORMAT(3x,('R(',I3,',',I3,') = ',F12.2))                        ! ANGLES.irp.f:  90
1001 FORMAT(3x,('A(',I3,',',I3,',',I3,') = ',F12.4))                 ! ANGLES.irp.f:  91
end                                                                  ! ANGLES.irp.f:  93
