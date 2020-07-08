subs = {}
NUM_SUBS_USABLE = 685 # may change after QC
with open("imagingcollection01.txt", 'r+') as f:
    # there are 
    subject_info = f.readlines()[2:2+NUM_SUBS_USABLE+1]
    for sub in subject_info:
        ID=sub.split()[4][1:-1]
        age=sub.split()[6][1:-1]
        sex=sub.split()[7][1:-1]
        subs += [ID, age, sex] 
# write to design matrix
with open("design_matrix.txt", "w+") as f:
    for sub in subs:
        f.write('\t'.join(sub))
# write to subject file listing
with open("files.txt", "w+") as f:
    for sub in subs:
        f.write(sub[ID+".mif"])
    

