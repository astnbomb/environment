#!/bin/bash

set -o nounset

remote_path=$1
copy_includes="/home/acormier/scripts/copy_includes.txt"

# cd to home folder
cd ~

cat $copy_includes | while read line; do
    scp -r "$line" $1
done
