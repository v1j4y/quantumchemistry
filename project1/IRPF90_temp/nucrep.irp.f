BEGIN_PROVIDER [double precision, enuc]
    BEGIN_DOC
    ! read nuclear repulsion energy
    END_DOC
    implicit none
    open(unit=991,file="enuc.dat")
    read(991,*)enuc
END_PROVIDER
