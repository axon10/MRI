
import os

for dir in os.listdir('../hcpa/'):
    #print(dir)
    scans = os.listdir("../hcpa/"+dir)
    
    images = 0
    vals = 0
    vecs = 0
    for scan in scans:
        if "V1_MR_dMRI_dir98_AP.nii.gz" in scan or "V1_MR_dMRI_dir98_PA.nii.gz" in scan or "V1_MR_dMRI_dir99_PA.nii.gz" in scan or "V1_MR_dMRI_dir99_AP.nii.gz" in scan:
            images += 1
        if "8_PA.bval" in scan or "9_PA.bval" in scan or "8_AP.bval" in scan or "9_AP.bval" in scan:
            vals += 1
        if "8_PA.bvec" in scan or "9_PA.bvec" in scan or "8_AP.bvec" in scan or "9_AP.bvec" in scan:
            vecs += 1
    if images <= 3 or vals <= 3 or vecs <= 3:
        print(dir + "is missing files from the original data that will never be recovered boohoo")
        print("removing ", "../hcpa/"+dir)
        os.system("rm -r " + "../hcpa/"+dir)


