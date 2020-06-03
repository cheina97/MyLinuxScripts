#!/bin/bash

icon=/home/cheina/Pictures/icons/bell.png

mess=$1
hh=$2
mm=$3

if [ $# -eq 3 ]; then
    zenity --notification --window-icon="$icon" --text "Impostato promemoria alle $hh:$mm\n$mess"
fi

while [ 0 ]; do
    s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
    hh2=$(echo $s|cut -d " " -f 5)
    mm2=$(echo $s|cut -d " " -f 6)

    if [ $hh2 -eq $hh ] && [ $mm2 -eq $mm ]; then
        zenity --notification --window-icon="$icon" --text "$mess"
        echo $mess | mio_parla
        exit
    fi
    sleep 25
done
