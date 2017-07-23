#!/bin/bash
source env-build-fenics.sh

FENICS_VERSION="2016.2.0"

# The ProgramOptions did not link on the Easybuild Boost, need to build Boost as well.
# Follow directions on boost.org with --prefix=$HOME/stow/boost before running script.
mkdir -p $BUILD_DIR

cd $BUILD_DIR && \
    wget --read-timeout=10 -nc https://bitbucket.org/fenics-project/mshr/downloads/mshr-${FENICS_VERSION}.tar.gz && \
    tar -xf mshr-${FENICS_VERSION}.tar.gz && \
    cd mshr-${FENICS_VERSION} && \
    mkdir -p build && \
    cd build && \
    cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} && \
    make -j ${BUILD_THREADS} && \
    make install
