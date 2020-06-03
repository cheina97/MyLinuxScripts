#!/bin/bash

wmctrl -l | grep -v "DDE Dock" | grep -v "dde-desktop" | while read line; do
    line=$(echo $line|cut -d " " -f 1)
    wmctrl -ic $line
done
