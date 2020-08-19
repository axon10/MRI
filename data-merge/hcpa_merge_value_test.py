sub = "HCA6000030_V1_MR"
subdir = sub + "_dMRI_dir9"
post = [subdir+"8_AP.bvec",subdir+"9_AP.bvec",subdir+"8_PA.bvec",subdir+"9_PA.bvec" ]
header = "/rri_disks/velleda/chen_lab/ahan/hcpa/"
def add(header, post):
    return [header + x for x in post]
AP98val, AP99val, PA98val, PA99val = add(header+sub+"/",post)
# this part must be edited in order to see to test bvecs
wc = 0
with open(AP98val, 'r+') as f:
    with open(AP99val, 'r+') as fh:
        wc98 = f.readlines()[0].split()
        print(wc98)
        wc98a = [1 for x in wc98 if float(x) <= 100 or (float(x)>=2900 and float(x) <= 3100)]
        wc99 = fh.readlines()[0].split()
        wc99a = [1 for x in wc99 if float(x) <= 100 or (float(x)>=2900 and float(x) <= 3100)]
        
        wc = sum(wc98a)
        wc += sum(wc99a)

with open(header+sub+"/HCA_AP.bvec", "r+") as f:
    numframes = f.readlines()[0].split()
    if len(numframes) == wc:
        print("it works!")
    else:
        print("there are ", len(numframes), " frames instead..")
        print("and not ", wc)



