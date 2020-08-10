#!/bin/bash
declare -A filenames
for filename in $PWD/HCA*/; do
    # take the substring
    start=3
    end=7
    filename=$(basename $filename)
   # echo $filename
    ID="${filename:$start:$end}"
   # echo $ID
    filenames[$ID]=1
done
for filename in "${!filenames[@]}"; do
    echo $filename
    echo $filename >> subIDs.txt
done
echo ${#filenames[@]}

