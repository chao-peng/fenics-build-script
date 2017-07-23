#!/bin/bash
source env-build-fenics.sh

source $HOME/.local/bin/virtualenvwrapper.sh
workon fenics-${TAG}

pip install networkx 
pip install git+https://github.com/hplgit/chaospy.git
