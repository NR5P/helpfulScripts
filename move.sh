#!/bin/bash

# Define source and destination directories
src_dir="/home/test/vids"
dst_user="plex"
dst_host="10.74.92.128"
dst_dir="/media/plex/New\ Volume1/Media/Movies"

# Move all files from the current directory to the destination directory
for file in $(ls -A $src_dir); do
    scp -r ./vids/$file $dst_user@$dst_host:"$dst_dir"
    if [ $? -eq 0 ]; then
        echo "Successfully copied $file, now removing..."
        rm ./vids/$file
    fi
done
