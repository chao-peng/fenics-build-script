#!/bin/bash
source env-build-fenics.sh

mkdir -p ${BUILD_DIR}

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc https://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz/download -O boost.tar.gz
   mkdir -p boost && \
   tar --strip-components=1 -xzf boost.tar.gz -C boost/ && \
   cd boost && \
   ./bootstrap.sh --prefix=$PREFIX --with-libraries=filesystem,program_options,random,regex,system,thread,timer,iostreams && \
   ./b2 -j ${BUILD_THREADS} install
