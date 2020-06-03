#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Inserire + o -"
    exit
fi

if [ "$1" != "+" ] && [ "$1" != "-" ]; then
    echo "Inserire + o -"
    exit
fi

if [ "$1" == "+" ]; then
    xdotool key XF86MonBrightnessUp
fi

if [ "$1" == "-" ]; then
    xdotool key XF86MonBrightnessDown
fi