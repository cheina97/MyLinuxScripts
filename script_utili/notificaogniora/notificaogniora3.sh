#!/bin/bash
icon=/home/cheina/Pictures/icons/clock.png

sleep 5
zenity --notification --window-icon="$icon" --text "Notifica oraria\nStato: attivo"

sleep 300

s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
last=$(echo $s|cut -d " " -f 5)
last30="null"
sleep 5
while [ 0 ]; do
    s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
    hh=$(echo $s|cut -d " " -f 5)
    mm=$(echo $s|cut -d " " -f 6)
    echo ""$hh" != "$last""
    echo "[ "$hh" != "$last30" ] && [ "$mm" == "30" ]"
    if [ "$hh" != "$last" ] ; then
        last=$hh
        ut=$(uptime -p)
        text=$(echo "$ut\n$hh:00:00")
        text2=$(echo "Sono le $hh")
        zenity --notification --window-icon="$icon" --text "$text"
        echo "$text2" | mio_parla
        echo "$text2" >> $HOME/Desktop/notificaogniora.log
    elif [ "$hh" != "$last30" ] && [ "$mm" == "30" ]; then
        last30=$hh
        ut=$(uptime -p)
        text=$(echo "$ut\n$hh:30:00")
        text2=$(echo "Sono le $hh e 30")
        zenity --notification --window-icon="$icon" --text "$text"
        echo "$text2" | mio_parla
    fi
    
    sleep 30
done

