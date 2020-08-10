import os

i=0
for sub in os.listdir("../AP_denoised"):
    #check sub
    files= os.listdir("../AP_denoised/"+sub)
    if 'HCA_PA_denoised.mif' not in files:
        print(sub)
        os.system("mv ../AP_denoised/"+sub + " ../PA_broken_raw")
        i+=1
print(i)    


