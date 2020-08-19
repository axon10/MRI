
#!/bin/bash

#SBATCH --array=1-650
#SBATCH --job-name=bias_correct
#SBATCH --time=00:02:00 #max time is 2 hrs for each bias correct
#SBATCH --mail-user=hana11@mcmaster.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-jjchen

#SBATCH --cpus-per-task=1
#SBATCH --mem=512M
# This is probably more than enough resources tbh

module load mrtrix
module load fsl
module load ants

echo "Starting task $SLURM_ARRAY_TASK_ID"
DIR=$(sed -n "${SLURM_ARRAY_TASK_ID}p" filenames.txt)
cd ./hcpa/$DIR
echo $PWD

dwibiascorrect -ants dwi_preprocessed_fixed.mif dwi_preprocessed_unbiased.mif

