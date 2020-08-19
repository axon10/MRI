
NUM_SUBS_USABLE = 685 # may change after QC, just keep this as a rough number, it doesn't really matter as long as
# this number is not less than the actual number of subjects

# read all subject info from raw HCPA datasheet, and extract the ID, age, and sex
sub_data = []
with open("imagingcollection01.txt", 'r+') as f:
     
    subject_info = f.readlines()[2:2+NUM_SUBS_USABLE+1]
    for sub in subject_info:
        ID=sub.split()[4][1:-1]+"_V1_MR"
        print(ID)
        age=sub.split()[6][1:-1]
        #print(age)
        sex=sub.split()[7][1:-1]
        #print(sex)
        sub_data.append([ID, age, sex])

# write to design matrix for statistical analysis
with open("design_matrix.txt", "w+") as f:
    with open("filenames.txt", "r+") as h:
        #record all subject directories with data present (aka subjects that survived QC)
        remaining_subs = [line.strip() for line in h.readlines()]
        for sub in sub_data:
            if sub[0] in remaining_subs:
                f.write('\t'.join(sub) + "\n")


    

