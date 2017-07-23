#!/bin/bash
#OAR -l cpu=8/core=6,walltime=0:10:00
#OAR --project project_rues
#OAR -t bigmem
#OAR -p cputype='xeon-haswell' OR cputype='xeon-ivybridge'
source /etc/profile
source $HOME/.profile
source $HOME/fenics-gaia-cluster/env-fenics.sh
# For MPICH/Intel MPI:
#time mpiexec -n 48 -launcher ssh -launcher-exec oarsh $@
# For OpenMPI:
time mpiexec -n 48 -launch-agent oarsh $@
# For gaia-80 e.g.:
##OAR -l cpu=8/core=3,walltime=0:10:00
##OAR --project project_rues
##OAR -t bigmem
##OAR -p cputype='xeon-haswell' OR cputype='xeon-ivybridge'
# For general cluster use, e.g.:
##OAR -l /enclosure=1/nodes=2/core=4,walltime=0:10:00
##OAR -p cputype='xeon-haswell' OR cputype='xeon-ivybridge'

