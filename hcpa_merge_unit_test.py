filename = '/rri_disks/velleda/chen_lab/ahan/hcpa/'
filename = filename + 'HCA9086283_V1_MR/HCA9086283_AP.bval'
with open(filename, 'r+') as f:
    x = f.readlines()
    subs = x[0].split()
    proper = 0
    for value in subs:
        if int(value) <= 100 or (int(value) >= 2900 and int(value) <= 3100):
            proper = proper + 1
    print("There are ", proper, "volumes that fit the criteria")
