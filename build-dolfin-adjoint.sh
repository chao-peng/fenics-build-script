#!/bin/bash
source env-build-fenics.sh

pip install --install-option="--prefix=${PREFIX}" git+https://bitbucket.org/dolfin-adjoint/dolfin-adjoint@dolfin-adjoint-2016.1.0
