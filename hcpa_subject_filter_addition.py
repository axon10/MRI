import os
header = "/rri_disks/fides/chen_lab/HCPA/imagingcollection01/"
post = "/unprocessed/Diffusion/"
home = "/rri_disks/velleda/chen_lab/ahan/hcpa/"
for dir in os.listdir('../hcpa/'):
    print(dir)
    #if "62499" in dir:
     #   print(dir)
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
        print(images, vals, vecs)
        print("trying to add AP files to ../hcpa/"+dir)
        
        print("cp "+ header+ dir+ post + dir + "_dMRI_dir99_AP.bval " + home +dir)
        os.system("cp "+ header+ dir+ post + dir + "_dMRI_dir99_AP.bval " + home + dir)
        os.system("cp "+ header+ dir+ post + dir + "_dMRI_dir98_AP.bval "+ home +dir)
        os.system("cp "+ header+ dir+ post + dir + "_dMRI_dir99_AP.bvec "+ home +dir)
        os.system("cp "+ header+ dir+ post + dir + "_dMRI_dir98_AP.bvec "+ home +dir)
        os.system("cp "+ header+ dir+ post + dir + "_dMRI_dir99_AP.nii.gz "+ home +dir)
        os.system("cp "+ header+ dir+ post + dir + "_dMRI_dir98_AP.nii.gz "+ home +dir)
