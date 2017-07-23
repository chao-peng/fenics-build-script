#!/bin/bash
source env-build-fenics.sh

export PETSC_DIR=${PREFIX}
export SLEPC_DIR=${PREFIX}
FENICS_VERSION="2017.1.0"

mkdir -p $BUILD_DIR

cd $BUILD_DIR && \
    wget --read-timeout=10 -nc https://bitbucket.org/fenics-project/ffc/downloads/ffc-${FENICS_VERSION}.tar.gz && \
    tar -xf ffc-${FENICS_VERSION}.tar.gz && \
    cd ffc-${FENICS_VERSION} && \
    ${PYTHON} setup.py install

cd $BUILD_DIR && \
    wget --read-timeout=10 -nc https://bitbucket.org/fenics-project/fiat/downloads/fiat-${FENICS_VERSION}.tar.gz && \
    tar -xf fiat-${FENICS_VERSION}.tar.gz && \
    cd fiat-${FENICS_VERSION} && \
    ${PYTHON} setup.py install

cd $BUILD_DIR && \
   wget --read-timeout=10 -nc https://bitbucket.org/fenics-project/dijitso/downloads/dijitso-${FENICS_VERSION}.tar.gz && \
   tar -xf dijitso-${FENICS_VERSION}.tar.gz && \
   cd dijitso-${FENICS_VERSION} && \
   ${PYTHON} setup.py install

cd $BUILD_DIR && \
    wget --read-timeout=10 -nc https://bitbucket.org/fenics-project/instant/downloads/instant-${FENICS_VERSION}.tar.gz && \
    tar -xf instant-${FENICS_VERSION}.tar.gz && \
    cd instant-${FENICS_VERSION} && \
    ${PYTHON} setup.py install

cd $BUILD_DIR && \
    wget --read-timeout=10 -nc https://bitbucket.org/fenics-project/ufl/downloads/ufl-${FENICS_VERSION}.tar.gz && \
    tar -xf ufl-${FENICS_VERSION}.tar.gz && \
    cd ufl-${FENICS_VERSION} && \
    ${PYTHON} setup.py install

USE_PYTHON3='ON'
cd $BUILD_DIR && \
    wget --read-timeout=10 -nc https://bitbucket.org/fenics-project/dolfin/downloads/dolfin-${FENICS_VERSION}.tar.gz && \
    tar -xf dolfin-${FENICS_VERSION}.tar.gz && \
    cd dolfin-${FENICS_VERSION} && \
    ${PYTHON} cmake/scripts/generate-swig-interface.py && \
    mkdir -p build && \
    cd build && \
    cmake ../ -DCMAKE_BUILD_TYPE=Release -DSLEPC_INCLUDE_DIRS=${PREFIX}/include -DPETSC_INCLUDE_DIRS=${PREFIX}/include -DSWIG_EXECUTABLE:FILEPATH=${PREFIX}/bin/swig -DCMAKE_INSTALL_PREFIX=${PREFIX} -DDOLFIN_USE_PYTHON3=${USE_PYTHON3} -DPYTHON_EXECUTABLE:FILEPATH=$(which ${PYTHON}) && \
    make -j ${BUILD_THREADS} && \
    make install
