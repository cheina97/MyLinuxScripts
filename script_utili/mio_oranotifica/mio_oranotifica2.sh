#!/bin/bash
icon=/home/cheina/Pictures/icons/clock.png

s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
s1=$(echo $s|cut -d " " -f 1)
s2=$(echo $s|cut -d " " -f 2)
s3=$(echo $s|cut -d " " -f 3)
s4=$(echo $s|cut -d " " -f 4)
s5=$(echo $s|cut -d " " -f 5)
s6=$(echo $s|cut -d " " -f 6)
s7=$(echo $s|cut -d " " -f 7)
text=$(echo "$s1 $s2 $s3 $s4\n$s5:$s6:$s7")

echo -e $text

zenity --notification --window-icon="$icon" --text "$text"
text2=$(echo "Sono le $s5 e $s6")
echo "$text2" | mio_parla
