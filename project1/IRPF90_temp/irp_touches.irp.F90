subroutine touch_ngauss
  Use readbasis_mod
  implicit none
  ngauss_is_built = .True.
end subroutine touch_ngauss

subroutine irp_finalize_1733191211
 use MOLDEN_mod
 use readbasis_mod
 use BETA_mod
 use HUCKEL_mod
 use DIST_mod
 use basis_mod
 use nucrep_mod
 use INP_mod
 use ANGLES_mod
  if (allocated(basis)) then
    basis_is_built = .False.
    deallocate(basis)
  endif
end
