#!/bin/bash
source env-build-fenics.sh

mkdir -p $BUILD_DIR

cd $BUILD_DIR && \
    wget --read-timeout=10 -nc https://cmake.org/files/v3.8/cmake-3.8.2.tar.gz
    tar -xf cmake-3.8.2.tar.gz && \
    cd cmake-3.8.2 && \
    mkdir -p build && \
    cd build && \
    cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} && \
    make -j${BUILD_THREADS} && \
    make install
