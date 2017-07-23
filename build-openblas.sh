#!/bin/bash
source env-build-fenics.sh

OPENBLAS_VERSION="0.2.19"

mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc https://github.com/xianyi/OpenBLAS/archive/v${OPENBLAS_VERSION}.tar.gz -O openblas.tar.bz2
   tar -xf openblas.tar.bz2 && \
   cd OpenBLAS-${OPENBLAS_VERSION} && \
   make -j1 PREFIX=${PREFIX} TARGET=SANDYBRIDGE USE_THREAD=0 NUM_THREADS=1 NO_PARALLEL_MAKE=1 && \
   make install PREFIX=${PREFIX}
