#!/bin/bash
source env-build-fenics.sh

HDF5_VERSION="1.8.17"

mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_VERSION}/src/hdf5-${HDF5_VERSION}.tar.bz2 -O hdf5.tar.bz2
   tar -xf hdf5.tar.bz2 && \
   cd hdf5-${HDF5_VERSION} && \
   ./configure CC=mpicc --enable-parallel --prefix=${PREFIX} && \
   make -j ${BUILD_THREADS} && \
   make install
