#!/bin/bash
source env-build-fenics.sh

mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   git clone https://bitbucket.org/dolfin-adjoint/libadjoint libadjoint && \
   cd libadjoint && \
   git checkout libadjoint-2016.1.0 && \
   mkdir build && \
   cd build && \
   cmake ../ -DCMAKE_INSTALL_PREFIX=${PREFIX} && \
   make && \
   make install
