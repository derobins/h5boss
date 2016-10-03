#!/bin/bash
#SBATCH -p debug 
#SBATCH -N 1
#SBATCH -t 00:15:00
#SBATCH -J subset-mpi
#SBATCH -e %j.err
#SBATCH -o %j.out
#SBATCH -L SCRATCH
cd $SLURM_SUBMIT_DIR
template=$CSCRATCH/bosslover/scaling-test/ost2/$SLURM_JOB_ID.h5
#cmd="srun -n 32 python-mpi ../scripts/subset_mpi_v1.py "
cmd="srun -n 1 python-mpi ../scripts/subset_mpi.py "
filepath=" input_csv/input-full-cori "
pmfquery=" pmf-list/large-scale/pmf1k1f.csv "
#pmfquery=" pmf-list/large-scale/pmf1k1f.csv "
fiber=$SLURM_JOB_ID"_nodes1k_fiber.txt "
catalog=$SLURM_JOB_ID"_nodes1k_catalog.txt "
datamap="datamap1.pk"
opt1=" --mpi=yes"
opt2=" --template=all" # other options are yes, no, all
opt3=" --fiber="
opt4=" --catalog="
opt5=" --datamap="
run=$cmd$filepath$template$pmfquery$opt1$opt2$opt3$fiber$opt4$catalog$opt5$datamap
#run=$cmd$filepath$template$pmfquery$opt1$opt2$opt3$fiber$opt4$catalog
echo $run
$run
