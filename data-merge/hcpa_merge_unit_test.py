filename = '/rri_disks/velleda/chen_lab/ahan/hcpa/'
filename = filename + 'HCA9086283_V1_MR/HCA9086283_AP.bval'

shell = 3000

with open(filename, 'r+') as f:
    x = f.readlines()
    subs = x[0].split()
    proper = 0
    for value in subs:
        if int(value) <= 100 or (int(value) >= shell - 100 and int(value) <= shell + 100):
            proper = proper + 1
    print("There are ", proper, "volumes that fit the criteria")
