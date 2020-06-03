#!/bin/bash
icon=/home/cheina/Pictures/icons/clock.png

sleep 5
zenity --notification --window-icon="$icon" --text "Notifica oraria\nStato: attivo"

sleep 300

s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
last=$(echo $s|cut -d " " -f 5)
sleep 5
while [ 0 ]; do
    s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
    s5=$(echo $s|cut -d " " -f 5)
    if [ "$s5" != "$last" ]; then
        last=$s5
        ut=$(uptime -p)
        text=$(echo "$ut\n$s5:00:00")
        text2=$(echo "Sono le $s5")
        zenity --notification --window-icon="$icon" --text "$text"
        echo "$text2" | mio_parla
    fi
    sleep 60
done

