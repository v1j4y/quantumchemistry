    SUBROUTINE INP
    PARAMETER(natomax=20)
    COMMON/coord/natom(natomax),x,y,z

    NAMELIST/input/atom,x,y,z

    open(unit=11,status='unknown',file='dist.dat',form='unformatted')

    write(6,*)'in input'
    read(5,input)


    end
