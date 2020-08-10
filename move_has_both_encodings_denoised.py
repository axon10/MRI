'''

Move 'denoised_individual_encodings' with uncorrupted 'both_encodings_denoised'
files to 'both_encodings_noncorrupted'

'''
import os
src="/software/anaconda3/bin/mrinfo"
home= "../denoised_individual_encodings_noncorrupted/"
i=0

for sub in os.listdir(home):
    
    files= os.listdir(home+sub)
    if 'both_encodings_denoised.mif' in files:
        os.system(src+" "+home+sub+"/both_encodings_denoised.mif > "+home+sub+"/has_both_encodings_denoised.txt")
        l = 0
        with open(home+sub+"/has_both_encodings_denoised.txt", "r+") as f:
	    l= f.readlines()
        # if both_encodings denoised file is not corrupt
        if len(l) >= 5:
            print(sub, "had both encodings denoised")
            os.system("mv "+home+sub + " ../both_encodings_denoised_noncorrupted")              
            i+=1
print(i)    


