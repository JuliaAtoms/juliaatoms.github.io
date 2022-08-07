# JuliaAtoms

Welcome to JuliaAtoms!

The [JuliaAtoms GitHub organisation](https://github.com/JuliaAtoms/)
collects a few [Julia](https://julialang.org) packages that are useful
for calculations within Atomic Physics.

At the moment, the following packages are available (all of them under
development, i.e. no stability promised yet):

- [AtomicLevels.jl](https://github.com/JuliaAtoms/AtomicLevels.jl)

  [![Version](https://img.shields.io/github/v/release/JuliaAtoms/AtomicLevels.jl)](https://github.com/JuliaAtoms/AtomicLevels.jl/releases)
  [![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaatoms.org/AtomicLevels.jl/stable/)
  [![Documentation (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaatoms.org/AtomicLevels.jl/dev/)
  [![GitHub Actions CI](https://github.com/JuliaAtoms/AtomicLevels.jl/workflows/CI/badge.svg)](https://github.com/JuliaAtoms/AtomicLevels.jl/actions)
  [![CodeCov](https://codecov.io/gh/JuliaAtoms/AtomicLevels.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaAtoms/AtomicLevels.jl)

  A library used to define electronic configurations constructed from
  electronic orbitals in spherical symmetry.

- [Atoms.jl](https://github.com/JuliaAtoms/Atoms.jl/)

  [![Version](https://img.shields.io/github/v/release/JuliaAtoms/Atoms.jl)](https://github.com/JuliaAtoms/Atoms.jl/releases)
  [![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaatoms.org/Atoms.jl/stable/)
  [![Documentation (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaatoms.org/Atoms.jl/dev/)
  [![GitHub Actions CI](https://github.com/JuliaAtoms/Atoms.jl/workflows/CI/badge.svg)](https://github.com/JuliaAtoms/Atoms.jl/actions)
  [![CodeCov](https://codecov.io/gh/JuliaAtoms/Atoms.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaAtoms/Atoms.jl)

  Data structures for representing atoms in a product space of
  orbitals and a radial grid. The radial grid can be any
  implementation of the
  [ContinuumArrays.jl](https://github.com/JuliaApproximation/ContinuumArrays.jl)
  interface, but Atoms.jl has only been tested with
  [CompactBases.jl](https://github.com/JuliaApproximation/CompactBases.jl)
  so far. It also contains a submodule for the solution of
  integro-differential eigenproblems, in a self-consistent manner, as
  well as using manifold optimization routines from
  [Optim.jl](https://github.com/JuliaNLSolvers/Optim.jl).

- [EnergyExpressions.jl](https://github.com/JuliaAtoms/EnergyExpressions.jl)

  [![Version](https://img.shields.io/github/v/release/JuliaAtoms/EnergyExpressions.jl)](https://github.com/JuliaAtoms/EnergyExpressions.jl/releases)
  [![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaatoms.org/EnergyExpressions.jl/stable/)
  [![Documentation (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaatoms.org/EnergyExpressions.jl/dev/)
  [![GitHub Actions CI](https://github.com/JuliaAtoms/EnergyExpressions.jl/workflows/CI/badge.svg)](https://github.com/JuliaAtoms/EnergyExpressions.jl/actions)
  [![CodeCov](https://codecov.io/gh/JuliaAtoms/EnergyExpressions.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaAtoms/EnergyExpressions.jl)

  A library for setting up the energy expression of a system built up
  from a set of configurations. At the moment, the implementation is
  geared towards atomic systems (in that it uses data structures from
  [AtomicLevels.jl](https://github.com/JuliaAtoms/AtomicLevels.jl)),
  but it is applicable to other systems as well, such as molecules.

- [AngularMomentumAlgebra.jl](https://github.com/JuliaAtoms/AngularMomentumAlgebra.jl)

  [![Version](https://img.shields.io/github/v/release/JuliaAtoms/AngularMomentumAlgebra.jl)](https://github.com/JuliaAtoms/AngularMomentumAlgebra.jl/releases)
  [![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaatoms.org/AngularMomentumAlgebra.jl/stable/)
  [![Documentation (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaatoms.org/AngularMomentumAlgebra.jl/dev/)
  [![GitHub Actions CI](https://github.com/JuliaAtoms/AngularMomentumAlgebra.jl/workflows/CI/badge.svg)](https://github.com/JuliaAtoms/AngularMomentumAlgebra.jl/actions)
  [![CodeCov](https://codecov.io/gh/JuliaAtoms/AngularMomentumAlgebra.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaAtoms/AngularMomentumAlgebra.jl)

  A library for the special case of energy expressions in spherical
  symmetry, but more importantly, also the computation of tensor
  matrix elements between spin-orbitals.

- [Hydrogen.jl](https://github.com/JuliaAtoms/Hydrogen.jl)

  [![Version](https://img.shields.io/github/v/release/JuliaAtoms/Hydrogen.jl)](https://github.com/JuliaAtoms/Hydrogen.jl/releases)
  [![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaatoms.org/Hydrogen.jl/stable/)
  [![Documentation (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaatoms.org/Hydrogen.jl/dev/)
  [![GitHub Actions CI](https://github.com/JuliaAtoms/Hydrogen.jl/workflows/CI/badge.svg)](https://github.com/JuliaAtoms/Hydrogen.jl/actions)
  [![CodeCov](https://codecov.io/gh/JuliaAtoms/Hydrogen.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaAtoms/Hydrogen.jl)

  Contains some of the analytically known results for atomic hydrogen,
  or more generally, a one-electron system in spherical symmetry.

- [CoulombIntegrals.jl](https://github.com/JuliaAtoms/CoulombIntegrals.jl)

  [![Version](https://img.shields.io/github/v/release/JuliaAtoms/CoulombIntegrals.jl)](https://github.com/JuliaAtoms/CoulombIntegrals.jl/releases)
  [![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaatoms.org/CoulombIntegrals.jl/stable/)
  [![Documentation (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaatoms.org/CoulombIntegrals.jl/dev/)
  [![GitHub Actions CI](https://github.com/JuliaAtoms/CoulombIntegrals.jl/workflows/CI/badge.svg)](https://github.com/JuliaAtoms/CoulombIntegrals.jl/actions)
  [![CodeCov](https://codecov.io/gh/JuliaAtoms/CoulombIntegrals.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaAtoms/CoulombIntegrals.jl)

  A library that implements the calculation of the Coulombic repulsion
  between pairs of electrons, also known as the Slater integrals.

---

As mentioned above, the radial problem is implemented using

- [CompactBases.jl](https://github.com/JuliaApproximation/CompactBases.jl/)

  [![Version](https://img.shields.io/github/v/release/JuliaApproximation/CompactBases.jl)](https://github.com/JuliaApproximation/CompactBases.jl/releases)
  [![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaApproximation.org/CompactBases.jl/stable/)
  [![Documentation (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaApproximation.org/CompactBases.jl/dev/)
  [![GitHub Actions CI](https://github.com/JuliaApproximation/CompactBases.jl/workflows/CI/badge.svg)](https://github.com/JuliaApproximation/CompactBases.jl/actions)
  [![CodeCov](https://codecov.io/gh/JuliaApproximation/CompactBases.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JuliaApproximation/CompactBases.jl)

  This library implements various basis sets of compact support, such
  as finite-difference, finite-element discrete-variable
  representation, and B-splines, all with their respective benefits
  and drawbacks for discretization of partial differential/integro-differential equations.
