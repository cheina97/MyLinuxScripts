#!/bin/bash

p=$(pwd)

if [ $# -ne 1 ];then
    echo "Errore: nome file mancante"
fi

if [ ! -e "$p/$1" ]; then
    echo "Errore: file inesistente"
fi

echo -n "\"$p/$1\""|xclip -selection clipboard
