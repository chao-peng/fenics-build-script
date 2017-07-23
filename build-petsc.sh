#!/bin/bash
source env-build-fenics.sh

VERSION="3.7.6"

mkdir -p $BUILD_DIR

cd ${BUILD_DIR} && \
   wget --read-timeout=10 -nc http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-${VERSION}.tar.gz
   tar -xf petsc-${VERSION}.tar.gz && \
   cd petsc-${VERSION} && \
#   ./configure --COPTFLAGS="-O2" \
#               --CXXOPTFLAGS="-O2" \
#	       --FOPTFLAGS="-O2" \
#               --with-blas-lib=${PREFIX}/lib/libopenblas.a --with-lapack-lib=${PREFIX}/lib/libopenblas.a \
#	       --with-c-support \
#	       --with-cxx-dialect=C++11 \
#	       --with-debugging=0 \
#	       --with-shared-libraries \
#	       --download-suitesparse \
#	       --download-scalapack \
#	       --download-metis \
#	       --download-parmetis \
#	       --download-ptscotch \
#	       --download-hypre \
#	       --download-mumps \
#               --download-ml \
#	       --prefix=${PREFIX} && \
    python2 './configure' '--COPTFLAGS=-O2' '--CXXOPTFLAGS=-O2' '--FOPTFLAGS=-O2' '--with-blas-lib=/home/chao/new_fenics/lib/libopenblas.a' '--with-lapack-lib=/home/chao/new_fenics/lib/libopenblas.a' '--with-c-support' '--with-cxx-dialect=C++11' '--with-debugging=0' '--with-shared-libraries' '--download-suitesparse' '--download-scalapack' '--download-metis' '--download-parmetis' '--download-ptscotch' '--download-hypre' '--download-mumps' '--download-ml' '--prefix=/home/chao/new_fenics/'
    make MAKE_NP=${BUILD_THREADS} && \
    make install
