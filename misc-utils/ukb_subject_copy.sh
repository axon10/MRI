#!/bin/bash
# Copy over 40 subjects from Ukbiobank to personal directory

i=0
b=40

for filename in /rri_disks/nemesis/chen_lab/jchad/3*/; do
    i+=1
    if [[ $i > $b ]]; then
        echo "Done"
        break 
    fi

    filename=$(basename $filename)
    echo $filename
    cp -r /rri_disks/nemesis/chen_lab/jchad/$filename/dMRI/dMRI /rri_disks/velleda/chen_lab/ahan/ukb/subs/$filename
done
