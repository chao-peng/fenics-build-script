#!/bin/bash
source ${HOME}/fenics-gaia-cluster/env-build-fenics.sh

# Caused random crashes for me. Stick with MPICH.
#module load mpi/impi/5.0.3.048-iccifort-2015.3.187
#source ${STORE}/intel/impi/2017.1.132/bin64/mpivars.sh 
#export I_MPI_FALLBACK=0
#export I_MPI_FABRICS="shm:dapl"

# OpenMPI settings
export OMPI_MCA_btl=self,vader,openib
export OMPI_MCA_btl_vader_single_copy_mechanism=cma
export OMPI_MCA_mpi_warn_on_fork=0

# Note: These must be unset initially, need to code this in somehow.
export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}

# Make sure OpenBLAS only uses one thread
export OPENBLAS_NUM_THREADS=1

export INSTANT_CACHE_DIR=${PREFIX}/.instant
export DIJITSO_CACHE_DIR=${PREFIX}/.dijitso
export INSTANT_ERROR_DIR=${PREFIX}/.instant
