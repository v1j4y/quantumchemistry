! -*- F90 -*-
!
!-----------------------------------------------!
! This file was generated with the irpf90 tool. !
!                                               !
!           DO NOT MODIFY IT BY HAND            !
!-----------------------------------------------!

        subroutine printbasis                                    ! printbasis.irp.f:   1
  use atoms_mod
  use basis_mod
            implicit none                                        ! printbasis.irp.f:   3
  character*(10) :: irp_here = 'printbasis'                      ! printbasis.irp.f:   1
            double precision :: array1(100)                      ! printbasis.irp.f:   4
            integer :: i,j,k,nui,nuj,nuk                         ! printbasis.irp.f:   5
            integer :: atype                                     ! printbasis.irp.f:   6
            character(len=100)  :: array2                        ! printbasis.irp.f:   7
            character :: char1,char2,char3,char4                 ! printbasis.irp.f:   8
            integer :: EOF                                       ! printbasis.irp.f:   9
            logical :: counti,yw,is_open,countw                  ! printbasis.irp.f:  10
  if (.not.atoms_is_built) then
    call provide_atoms
  endif
  if (.not.basis_is_built) then
    call provide_basis
  endif
            print *,basis                                        ! printbasis.irp.f:  12
            inquire(unit=201,opened=is_open)                     ! printbasis.irp.f:  14
            if(.not.is_open)then                                 ! printbasis.irp.f:  15
                open(unit=201,status='old',file='atyp.dat')      ! printbasis.irp.f:  16
            endif                                                ! printbasis.irp.f:  17
            open(unit=700,status='old',file='STO-3G.basis')      ! printbasis.irp.f:  18
            open(unit=33,status='old',file='geo.molden',form='formatted',position='append') ! printbasis.irp.f:  19
            EOF=1                                                ! printbasis.irp.f:  21
            i=2                                                  ! printbasis.irp.f:  22
            counti=.FALSE.                                       ! printbasis.irp.f:  23
            countw=.FALSE.                                       ! printbasis.irp.f:  24
            do i=1,atoms                                         ! printbasis.irp.f:  26
            rewind(700)                                          ! printbasis.irp.f:  27
            read(201,*)atype                                     ! printbasis.irp.f:  28
            print *,atype                                        ! printbasis.irp.f:  29
            EOF=1                                                ! printbasis.irp.f:  30
            counti=.FALSE.                                       ! printbasis.irp.f:  31
            countw=.FALSE.                                       ! printbasis.irp.f:  32
            do while(EOF.ge.0)                                   ! printbasis.irp.f:  33
                read(700,'(A)',IOSTAT=EOF)array2                 ! printbasis.irp.f:  34
                if(.not.counti)then                              ! printbasis.irp.f:  35
                read(array2,'(3A)')char1,char2,char3             ! printbasis.irp.f:  36
                if(countw)then                                   ! printbasis.irp.f:  37
                read(array2,'(3A)')char1,char2,char3             ! printbasis.irp.f:  38
                if(char1.ne.'$'.and.char1.ne.'A')then            ! printbasis.irp.f:  39
                write(33,*)char1                                 ! printbasis.irp.f:  40
                write(33,'(10A)')array2                          ! printbasis.irp.f:  41
                endif                                            ! printbasis.irp.f:  42
                endif                                            ! printbasis.irp.f:  43
                else                                             ! printbasis.irp.f:  44
                read(array2,'(4A)')char1,char2,char3,char4       ! printbasis.irp.f:  45
                if(countw)then                                   ! printbasis.irp.f:  46
                read(array2,'(3A)')char1,char2,char3             ! printbasis.irp.f:  47
                if(char1.ne.'$'.and.char1.ne.'A')then            ! printbasis.irp.f:  48
                print *,char1                                    ! printbasis.irp.f:  49
                write(33,'(10A)')array2                          ! printbasis.irp.f:  50
                endif                                            ! printbasis.irp.f:  51
                endif                                            ! printbasis.irp.f:  52
                endif                                            ! printbasis.irp.f:  53
                if(char1.eq.'A')then                             ! printbasis.irp.f:  54
                    countw=.FALSE.                               ! printbasis.irp.f:  55
                    print *,'A'                                  ! printbasis.irp.f:  56
                    read(char3,*)nui                             ! printbasis.irp.f:  57
                    if(counti)then                               ! printbasis.irp.f:  58
                    read(char4,*)nuj                             ! printbasis.irp.f:  59
                    nuk=nui*10+nuj                               ! printbasis.irp.f:  60
                    else                                         ! printbasis.irp.f:  61
                    nuk=nui                                      ! printbasis.irp.f:  62
                    endif                                        ! printbasis.irp.f:  63
                    if(nui.eq.9) then                            ! printbasis.irp.f:  64
counti=.TRUE.                                                    ! printbasis.irp.f:  64
  endif                                                          ! printbasis.irp.f:  64
                if(nuk.eq.atype)then                             ! printbasis.irp.f:  65
                    write(33,*)i,0                               ! printbasis.irp.f:  66
                    countw=.TRUE.                                ! printbasis.irp.f:  67
                endif                                            ! printbasis.irp.f:  68
                endif                                            ! printbasis.irp.f:  69
            enddo                                                ! printbasis.irp.f:  70
            enddo                                                ! printbasis.irp.f:  71
end                                                              ! printbasis.irp.f:  72
