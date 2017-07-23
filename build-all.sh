#!/bin/bash
set -e

./build-cmake.sh
./build-openmpi.sh
./build-openblas.sh
./build-boost.sh
./build-hdf5.sh
./build-swig.sh
./build-petsc.sh
./build-slepc.sh
./build-eigen.sh
./build-python-modules.sh
./build-fenics.sh
