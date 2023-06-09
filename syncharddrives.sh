#!/bin/bash

#sudo apt-get install rsync inotify-tools

# Define source directory and destination directory
src_dir="/path/to/source/directory"
dst_user="username"
dst_host="hostname"
dst_dir="/path/to/destination/directory"

# Use inotifywait to watch the source directory for changes
inotifywait -m -r -e create --format '%w%f' "${src_dir}" | while read file
do
    # When a new file is created, sync it to the destination
    rsync -avz --progress "${file}" "${dst_user}@${dst_host}:${dst_dir}"
done
