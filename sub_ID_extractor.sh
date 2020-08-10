#!/bin/bash
declare -A filenames
for filename in /rri_disks/fides/chen_lab/HCPA/imagingcollection01/HCA*/; do
    # take the substring
    start=4
    end=6
    filename=$(basename $filename)
    echo $filename
    ID="${filename:$start:$end}"
   # echo $ID
    filenames[$ID]=1
done
for filename in "${!filenames[@]}"; do
    echo $filename
    echo $filename >> subIDs.txt
done
echo ${#filenames[@]}

