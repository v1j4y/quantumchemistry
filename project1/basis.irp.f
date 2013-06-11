BEGIN_PROVIDER [character, basis, (1)]
    BEGIN_DOC
    ! read basis from file and print parameters
    END_DOC
    implicit none

    print *,'basis?'
    basis='S'
    print *, 'atoms',atoms
!   print *,basis
!   print *,'STO3G'

END_PROVIDER
