#!/bin/bash

if [ $# -eq 1 ]; then
     dir=$1
else
     dir="$HOME/Desktop"
fi

i=0

while [ 0 ]; do
    if [ ! -f "$dir/`printf %06d $i`.jpeg" ]; then
        ffmpeg -f v4l2 -i /dev/video0 -vframes 1 "$dir"/`printf %06d $i`.jpeg  &> /dev/null 
        echo "$dir/`printf %06d $i`.jpeg"
        exit 0
    fi
    let i++
    
done
