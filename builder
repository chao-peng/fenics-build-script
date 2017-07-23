#!/bin/bash
oarsub -I -l nodes=1/core=4,walltime=4 -p "cputype='xeon-haswell' OR cputype='xeon-ivybridge'" 
