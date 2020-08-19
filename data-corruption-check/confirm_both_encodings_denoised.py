'''

Move 'both_encodings' uncorrupted files to separate directory

'''
import os

home= "../both_encodings_noncorrupted/"
i=0
for sub in os.listdir(home):
    #check sub
    files= os.listdir(home+sub)
    if 'both_encodings_denoised.mif' in files:
        os.system("/software/anaconda3/bin/mrinfo " +home+sub+"/both_encodings_denoised.mif > "+home+sub+"/has_both_encodings.txt")
        l = 0
        with open(home+sub+"/has_both_encodings.txt", "r+") as f:
	    l= f.readlines()
        if len(l) <= 5:
            os.system("mv " +home+sub + " ../both_encodings_corrupted")
            i+=1
            print(sub, "did not have both encodings")
        else:
	    print(l[0])
	    print(sub, "had both encodings!!")
              
print(i)    


