#!/bin/bash
#SBATCH -p regular 
#SBATCH -N 1
#SBATCH -t 00:50:00
#SBATCH -J subset-serial-bb
#SBATCH -e %j_1k.err
#SBATCH -o %j_1k.out
#SBATCH -A mpccc
#DW jobdw capacity=4420GB access_mode=striped type=scratch
#DW stage_in source=/global/cscratch1/sd/jialin/h5boss destination=$DW_JOB_STRIPED/ type=directory
##DW stage_out source=$DW_JOB_STRIPED/output/1k_aug5.h5 destination=/global/cscratch1/sd/jialin type=file
SCRDIR=$DW_JOB_STRIPED
module load dws
module load python
export PYTHONPATH=/global/homes/j/jialin/h5boss-util/h5boss_py:$PYTHONPATH
export PATH=/global/homes/j/jialin/h5boss-util/h5boss_py/scripts:$PATH

cd $SLURM_SUBMIT_DIR
#ls $DW_JOB_STRIPED
find $DW_JOB_STRIPED > input-full-bb
subset input-full-bb /global/cscratch1/sd/jialin/bosslover/scaling-test/1k_bb.h5 pmf-list/pmf1k
