import os
# move to hcpa subjects dir
#os.system("cd ../hcpa/")
#os.system(" echo $PWD")
for root, dirs, files in os.walk("/rri_disks/velleda/chen_lab/ahan/hcpa/"):
    for name in dirs:
        os.system("cd ../hcpa; ls")
        #os.system("cd " + name)
        #os.system("$PWD")
        ID = name[0:len(name)-6]
        PA_image = "../hcpa/"+ name+ "/" + ID+ "_PA.nii"
        PA_bval = "../hcpa/"+ name+ "/" + ID+"_PA.bval"
        PA_bvec = "../hcpa/"+ name+ "/" + ID+"_PA.bvec"
        print(PA_image)
        os.system("mv " + PA_image + " " + PA_image.replace(ID+"_PA", "HCA_PA"))
        os.system("mv " + PA_bval + " " + PA_bval.replace(ID+"_PA", "HCA_PA"))
        os.system("mv " + PA_bvec + " " + PA_bvec.replace(ID+"_PA", "HCA_PA"))
        