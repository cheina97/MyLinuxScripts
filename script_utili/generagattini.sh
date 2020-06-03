#!/bin/bash

while [ true ]; do
    r1=$RANDOM
    r2=$RANDOM
    let r=r1%2
    let r2=10+r1%35
    if [ $r -eq 0 ]; then
        color="-rv"
    elif [ $r -eq 1 ]; then
        color=" "
    fi
    oneko -speed $r2 $color &
    echo "oneko $color -speed $r2"
    sleep 1s
done
