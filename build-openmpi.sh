#!/bin/bash
source env-build-fenics.sh

OPENMPI_VERSION="2.1.1"

mkdir -p ${BUILD_DIR}

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc --no-check-certificate http://www.open-mpi.org/software/ompi/v2.1/downloads/openmpi-${OPENMPI_VERSION}.tar.gz -O openmpi.tar.gz
   tar -xf openmpi.tar.gz && \
   cd openmpi-${OPENMPI_VERSION} && \
   ./configure --prefix=${PREFIX} --with-cma && \
   make -j ${BUILD_THREADS} && \
   make install
