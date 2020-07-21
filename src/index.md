# JuliaAtoms

Welcome to JuliaAtoms!

The [JuliaAtoms GitHub organisation](https://github.com/JuliaAtoms/)
collects a few [Julia](https://julialang.org) packages that are useful
for calculations within Atomic Physics.

At the moment, the following packages are available (all of them under
development, i.e. no stability promised yet):

- [AtomicLevels.jl](https://github.com/JuliaAtoms/AtomicLevels.jl)
  ([documentation](https://juliaatoms.github.io/AtomicLevels.jl)) A
  library used to define electronic configurations constructed from
  electronic orbitals in spherical symmetry.
- [Atoms.jl](https://github.com/JuliaAtoms/Atoms.jl/)
  ([documentation](https://juliaatoms.github.io/Atoms.jl/dev/)) Data
  structures for representing atoms in a product space of orbitals and
  a radial grid. The radial grid can be any implementation of the
  [ContinuumArrays.jl](https://github.com/JuliaApproximation/ContinuumArrays.jl)
  interface, but Atoms.jl has only been tested with
  [CompactBases.jl](https://github.com/JuliaApproximation/CompactBases.jl)
  so far.
- [EnergyExpressions.jl](https://github.com/JuliaAtoms/EnergyExpressions.jl)
  ([documentation](https://juliaatoms.github.io/EnergyExpressions.jl/dev/))
  A library for setting up the energy expression of a system built up
  from a set of configurations. At the moment, the implementation is
  geared towards atomic systems (in that it uses data structures from
  AtomicLevels.jl), but it is applicable to other systems as well,
  such as molecules.
- [SCF.jl](https://github.com/JuliaAtoms/SCF.jl)
  ([documentation](https://juliaatoms.github.io/SCF.jl/dev/)) A
  library for the solution of integro-differential eigenproblems, in a
  self-consistent manner.
- [AngularMomentumAlgebra.jl](https://github.com/JuliaAtoms/AngularMomentumAlgebra.jl)
  ([documentation](https://juliaatoms.github.io/AngularMomentumAlgebra.jl/dev/))
  A library for the special case of energy expressions in spherical
  symmetry, but more importantly, also the computation of tensor
  matrix elements between spin-orbitals.
- [AtomicPotentials.jl](https://github.com/JuliaAtoms/AtomicPotentials.jl)
  Provides structures for modelling the atomic nucleus as a potential.
- [Hydrogen.jl](https://github.com/JuliaAtoms/Hydrogen.jl) Contains
  some of the analytically known results for atomic hydrogen, or more
  generally, a one-electron system in spherical symmetry.

Related packages, outside JuliaAtoms:

- [CoulombIntegrals.jl](https://github.com/jagot/CoulombIntegrals.jl)
  A library that implements the calculation of the Coulombic repulsion
  between pairs of electrons, also known as the Slater integrals.
- [PseudoPotentials.jl](https://github.com/jagot/PseudoPotentials.jl)
  Model potentials used to reduces calculation complexity by
  representing a core of electrons in a mean-field sense. This can
  turn a multi-electron problem into an approximate few- or
  single-electron problem.
