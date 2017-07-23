#!/bin/bash
source env-build-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

${PYTHON} -m pip install --timeout 100 --no-cache-dir numpy numexpr petsc4py slepc4py ply six sympy mpi4py pandas ipython ipyparallel 
