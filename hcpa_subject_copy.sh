
#!/bin/bash

for filename in /rri_disks/fides/chen_lab/HCPA/imagingcollection01/*MR/; do
    echo $filename

    sub_ID=$(basename $filename)
    
    loc=/rri_disks/velleda/chen_lab/ahan/hcpa/$sub_ID
    echo $loc
    mkdir -p $loc && cp $filename/unprocessed/Diffusion/* $loc
done


