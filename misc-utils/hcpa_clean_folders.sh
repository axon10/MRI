for filename in /rri_disks/velleda/chen_lab/ahan/hcpa/*/; do
    dir=$filename
    cd $dir
    # collapse all directories so that all files are in 1 respective subject folder
   # find $PWD -mindepth 2 -type f -exec mv -t $PWD -i '{}' +
    rm -r *.json
    rm -r unprocessed
done
