#!/bin/bash

wmctrl -l | grep -v "DDE Dock" | grep -v "dde-desktop" | while read line; do
    n=$(echo $line|cut -d " " -f 2)
    current=$(xdotool get_desktop)
    if [ $n -eq $current ];then
        line=$(echo $line|cut -d " " -f 1)
        wmctrl -ic $line
    fi
done
