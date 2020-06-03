#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Inserire valore da 1 a 3"
    exit
fi

if [ $1 -eq 1 ]; then
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga
elif [ $1 -eq 2 ]; then
    paplay /usr/share/sounds/freedesktop/stereo/bell.oga
elif [ $1 -eq 3 ]; then
    paplay /home/cheina/Music/sounds/ff7/save.wav
else
    echo "Inserire valore da 1 a 3"
fi

