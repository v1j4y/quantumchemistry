        subroutine printbasis

            implicit none
            double precision :: array1(100)
            integer :: i,j,k,nui,nuj,nuk
            integer :: atype
            character(len=50)  :: array2
            character :: char1,char2,char3,char4
            integer :: EOF
            logical :: counti,yw,is_open,countw

            print *,basis

            inquire(unit=201,opened=is_open)
            if(.not.is_open)then
                open(unit=201,status='old',file='atyp.dat')
            endif
            open(unit=700,status='old',file='STO-3G.basis')
            open(unit=33,status='old',file='geo.molden',form='formatted',position='append')

            EOF=1
            i=2
            counti=.FALSE.
            countw=.FALSE.

            do i=1,atoms
            rewind(700)
            read(201,*)atype
            print *,atype
            EOF=1
            counti=.FALSE.
            countw=.FALSE.
            do while(EOF.ge.0)
                read(700,'(A)',IOSTAT=EOF)array2
                if(.not.counti)then
                read(array2,'(3A)')char1,char2,char3
                if(countw)then
                read(array2,'(3A)')char1,char2,char3
                if(char1.ne.'$'.and.char1.ne.'A')then
!               write(33,*)char1
                write(33,1001)char1
!               write(33,'(10A),$')array2
                write(33,1000)array2
                endif
                endif
                else
                read(array2,'(4A)')char1,char2,char3,char4
                if(countw)then
                read(array2,'(3A)')char1,char2,char3
                if(char1.ne.'$'.and.char1.ne.'A')then
                print *,char1
                write(33,1001)char1
!               write(33,'(10A),$')array2
!               write(33,'(10A),$')array2
                write(33,1000)array2
                endif
                endif
                endif
                if(char1.eq.'A')then
                    countw=.FALSE.
                    print *,'A'
                    read(char3,*)nui
                    if(counti)then
                    read(char4,*)nuj
                    nuk=nui*10+nuj
                    else
                    nuk=nui
                    endif
                    if(nui.eq.9)counti=.TRUE.
                if(nuk.eq.atype)then
                    write(33,1001)
                    write(33,1002)i
                    countw=.TRUE.
                endif
                endif
            enddo
            enddo
1000  FORMAT (1A,$)
1001  FORMAT (1A)
1002  FORMAT (I1,' 0',$)
        end
