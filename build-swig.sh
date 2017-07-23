#!/bin/bash
source env-build-fenics.sh

SWIG_VERSION="3.0.12"

mkdir -p ${BUILD_DIR}

cd ${BUILD_DIR} && \
    wget --read-timeout=10 -nc http://downloads.sourceforge.net/swig/swig-${SWIG_VERSION}.tar.gz && \
    tar xf swig-${SWIG_VERSION}.tar.gz && \
    cd swig-${SWIG_VERSION} && \
    ./configure --prefix=${PREFIX} && \
    make -j ${BUILD_THREADS} && \
    make install
