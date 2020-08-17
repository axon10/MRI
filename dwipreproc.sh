#!/bin/bash

#SBATCH --array=1-650
#SBATCH --job-name=preproc
#SBATCH --time=40:00:00 #max time is 40 hours for each task
#SBATCH --mail-user=hana11@mcmaster.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-jjchen

#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
# request 1 gpu for each array task, and 8GB of the node for each array task (eddy needs 3 GB but who knows what else happens in dwifslpreproc)

module load mrtrix
module load fsl
module load cuda

echo "Starting task $SLURM_ARRAY_TASK_ID"
DIR=$(sed -n "${SLURM_ARRAY_TASK_ID}p" filenames.txt)
cd ./hcpa
echo $PWD
dwipreproc $DIR/both_encodings_denoised.mif $DIR/dwi_preprocessed.mif -pe_dir AP -rpe_all -eddy_options " --slm=linear --data_is_shelled "
