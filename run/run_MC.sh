#!/usr/bin/scl enable devtoolset-8 -- /bin/bash
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --partition=shared
#SBATCH --job-name=examples

timestamp=$(date +%s)

#-o -A HPS:hps-prod

hps-mc-batch slurm --memory 4000 -W 48 \
	-E /sdf/home/m/mgignac/HPS/hps-mc/install/bin/hps-mc-env.sh \
	-c /fs/ddn/sdf/group/hps/users/mgignac/hps-mc-scripts/run/.hpsmc \
	-d /sdf/scratch/hps/mgignac/output/MC/$timestamp \
	-l /sdf/scratch/hps/mgignac/logs/MC/$timestamp/ \
	beam_sample /fs/ddn/sdf/group/hps/users/mgignac/hps-mc-scripts/setup_jobs/jobs.json 
