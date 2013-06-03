subroutine irp_finalize_1733191211
 use MOLDEN_mod
 use printbasis_mod
 use BETA_mod
 use HUCKEL_mod
 use DIST_mod
 use atoms_mod
 use basis_mod
 use nucrep_mod
 use readbasis_mod
 use INP_mod
 use ANGLES_mod
  if (allocated(basis)) then
    basis_is_built = .False.
    deallocate(basis)
  endif
end
