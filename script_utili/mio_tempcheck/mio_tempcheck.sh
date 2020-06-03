#!/bin/bash

sleep 5

icon="/home/cheina/Pictures/icons/temp.png"

if [ $# -ne 1 ]; then
    echo "Errore: argomento errato, inserire temperatura soglia"
fi

zenity --notification --window-icon="$icon" --text "Controllo temperatura\nStato: attivo a $1°"

while [ 0 ]; do
    t1=$(sensors|grep temp1 | head -3|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
    t2=$(sensors|grep temp1 | head -4|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
    t3=$(sensors|grep temp1 | head -5|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)

    if [ $t1 -gt $1 ] || [ $t2 -gt $1 ] || [ $t3 -gt $1 ]; then

        t=$t1;
        if [ $t2 -gt $t ]; then
            t=$t2
        fi
        if [ $t3 -gt $t ]; then
            t=$t3
        fi

        zenity --notification --window-icon="$icon" --text "CPU surriscaldata\nTemperatura: $t°"
        mio_beep 2
    fi
    
    sleep 60
done
