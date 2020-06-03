#!/bin/bash

icon=/home/cheina/Pictures/icons/clock.png

last=" "
sleep 5
flag=0
while [ 0 ]; do
    s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
    s5=$(echo $s|cut -d " " -f 5)
    if [ "$s5" != "$last" ]; then
        last=$s5
        ut=$(uptime -p)
        text=$(echo "$ut\n$s5:00:00")
        if [ $flag -ne 0 ]; then
            zenity --notification --window-icon="$icon" --text "$text"
        else
            let flag++
        fi
    fi
    sleep 60;
done

