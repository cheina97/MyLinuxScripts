#|/bin/bash

s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
hh2=$(echo $s|cut -d " " -f 5)
mm2=$(echo $s|cut -d " " -f 6)

x=$(yad --height="140" --borders="15" --title="Promemoria"  \
--form \
--field="Messaggio " \
--field="Orario" \
"Ricordami di ..." "$hh2:$mm2") 

mes=$(echo $x | cut -f 1 -d "|" )
ora=$(echo $x | cut -f 2 -d "|" )
hh=$(echo $ora | cut -d : -f 1)
mm=$(echo $ora | cut -d : -f 2)

echo "$ora $mes"

if [ -z "$mes" ] || [ -z "$ora" ];then
    yad --height=90 --borders="15" --title="Errore" --text="PARAMETRI ERRATI" --text-align=center
    exit
fi

$HOME/Documents/Bash/script_utili/mio_promemoria/mio_promemoria_back.sh "$mes" $hh $mm &>/dev/null &
