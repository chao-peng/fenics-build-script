#!/bin/bash
source env-build-fenics.sh

mkdir -p /tmp/fenics-${USER}
cd /tmp/fenics-${USER}
wget https://bootstrap.pypa.io/get-pip.py
${PYTHON} get-pip.py --user

wget https://bootstrap.pypa.io/ez_setup.py 
${PYTHON} ez_setup.py --user

${PYTHON} -m pip install --user virtualenv
${PYTHON} -m pip install --user virtualenvwrapper
