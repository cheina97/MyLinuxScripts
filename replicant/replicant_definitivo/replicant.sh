#!/bin/bash
if [ $# -ne 2 ]; then
    echo "ERRORE: argomenti mancanti (nome, numero)"
    exit
fi
name=$1
max=$2
i=0

touch $HOME/Desktop/$name

while [ true ]; do
    sleep 1
    if [ "$(find $HOME/Desktop -regex ".*/"$name"[0-9]+" | wc -l)" -lt $max ]; then
        #let max=max*2
        echo mancante $max
        i=0
        while [ $i -lt $max ]; do
            if [ -e "$HOME/Desktop/$name$i" ]; then
                let i++
                continue
            fi
            if [ ! -e $name ]; then 
                touch $HOME/Desktop/$name
            fi
            cp $HOME/Desktop/$name $HOME/Desktop/"$name""$i"
            let i++
        done
    fi
done




