#!/bin/bash
source env-build-fenics.sh

SLEPC_VERSION="3.7.4"
export PETSC_DIR=${PREFIX}

mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc http://www.grycap.upv.es/slepc/download/download.php?filename=slepc-${SLEPC_VERSION}.tar.gz -O slepc-${SLEPC_VERSION}.tar.gz
   tar -xf slepc-${SLEPC_VERSION}.tar.gz && \
   cd slepc-${SLEPC_VERSION} && \
#   ./configure --prefix=${PREFIX} && \
   python2 './configure' '--prefix=/home/chao/new_fenics'
   make MAKE_NP=${BUILD_THREADS} && \
   make install
