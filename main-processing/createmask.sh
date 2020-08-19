
#!/bin/bash

#SBATCH --array=1-650
#SBATCH --job-name=preproc
#SBATCH --time=00:10:00 #max time is 40 hours for each task
#SBATCH --mail-user=hana11@mcmaster.ca
#SBATCH --mail-type=ALL
#SBATCH --account=def-jjchen

#SBATCH --cpus-per-task=1
#SBATCH --mem=512M
# This is probably more than enough resources tbh

module load mrtrix
module load fsl


echo "Starting task $SLURM_ARRAY_TASK_ID"
DIR=$(sed -n "${SLURM_ARRAY_TASK_ID}p" filenames.txt)
cd ./hcpa/$DIR
echo $PWD

#USING Mrtrix3 dwi2mask utility (vastly superior to BET)
mrconvert both_encodings_denoised.mif dummy_data.mif -coord 3 0:105 -export_grad_fsl AP_bvecs AP_bvals #extract first half of bvecs/vals
mrconvert dwi_preprocessed.mif -fslgrad AP_bvecs AP_bvals dwi_preprocessed_fixed.mif                   #import into data
dwi2mask dwi_preprocessed_fixed.mif dwi_mask.mif                                                       #create mask
rm dwi_preprocessed.mif dummy_data.mif AP_bvecs AP_bvals                                               #remove extra data

