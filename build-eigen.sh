#!/bin/bash
source env-build-fenics.sh

EIGEN_VERSION="3.3.3"

mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc http://bitbucket.org/eigen/eigen/get/${EIGEN_VERSION}.tar.bz2 -O eigen.tar.bz2 && \
   mkdir -p ${BUILD_DIR}/eigen && \
   tar -xf eigen.tar.bz2 -C ${BUILD_DIR}/eigen --strip-components=1 && \
   cd eigen && \
   mkdir -p build && \
   cd build && \
   cmake ../ -DCMAKE_INSTALL_PREFIX=${PREFIX} && \
   make install
