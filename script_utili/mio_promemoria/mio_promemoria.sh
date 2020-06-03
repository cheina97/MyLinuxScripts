#!/bin/bash

if [ $# -lt 2 ];then
    echo errore: argomenti [mess] [hh:mm] [suppress_notify]
    exit
fi

mes=$1
hh=$(echo $2 | cut -d : -f 1)
mm=$(echo $2 | cut -d : -f 2)

if [ $# -ne 2 ]; then
    nohup $HOME/Documents/Bash/script_utili/mio_promemoria/mio_promemoria_back.sh "$mes" $hh $mm $3 &>/dev/null &
else
    nohup $HOME/Documents/Bash/script_utili/mio_promemoria/mio_promemoria_back.sh "$mes" $hh $mm &>/dev/null &
fi


echo "promemoria settato alle $hh:$mm"
echo $mes
