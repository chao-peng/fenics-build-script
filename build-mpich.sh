#!/bin/bash
source env-build-fenics.sh

MPICH_VERSION="3.2"

mkdir -p ${BUILD_DIR}

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz -O mpich.tar.gz && \
   tar -xf mpich.tar.gz && \
   cd mpich-${MPICH_VERSION} && \
   ./configure --prefix=${PREFIX} --enable-shared && \
   make -j ${BUILD_THREADS} && \
   make install
