#!/bin/bash

# For DOLFIN
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

# PREFIX is where the root of the install will be. $WORK or $HOME are good
# choices, or $STORE if your happy only to run FEniCS on gaia-80.  BUILD_DIR is
# where everything will be built. If you build on gaia-80, $STORE is a good
# choice.  Make sure you have created your /store directory at
# /store/rues/your-username on gaia-80 and set the variable $STORE in your
# .profile.
PYTHON=python
TAG=15062017
PREFIX=/home/chao/new_fenics
WORKON_HOME=${PREFIX}/virtualenv
BUILD_DIR=/home/chao/new_fenics/build-${TAG}
BUILD_THREADS=4

export PATH=${PREFIX}/bin:${PATH}
export LD_LIBRARY_PATH=${PREFIX}/lib:${LD_LIBRARY_PATH}
export C_INCLUDE_PATH=${PREFIX}/include:${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=${PREFIX}/include:${CPLUS_INCLUDE_PATH}

export PETSC_DIR=${PREFIX}
unset PETSC_ARCH
export SLEPC_DIR=${PREFIX}

