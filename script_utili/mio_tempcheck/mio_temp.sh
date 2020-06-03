#!/bin/bash

icon="/home/cheina/Pictures/icons/temp.png"

t1=$(sensors|grep temp1 | head -3|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
t2=$(sensors|grep temp1 | head -4|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
t3=$(sensors|grep temp1 | head -5|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
echo $t1 $t2 $t3
t=$t1;
if [ $t2 -gt $t ]; then
    t=$t2
fi
if [ $t3 -gt $t ]; then
    t=$t3
fi

zenity --notification --window-icon="$icon" --text "Temperatura CPU: $t°"

#mio_beep 2
