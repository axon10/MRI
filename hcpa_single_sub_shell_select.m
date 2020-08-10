sub=8657295
AP98 = sprintf('/rri_disks/velleda/chen_lab/ahan/hcpa/HCA%d_V1_MR/unprocessed/Diffusion/HCA%d_V1_MR_dMRI_dir99_PA.nii.gz', sub,sub);
vol_1 = MRIread(AP98);
sprintf('Originally had %d shells', size(vol_1.vol,4))
%unit test to read in 1 volume

D = dir;
D = D(~ismember({D.name}, {'.', '..'}))
