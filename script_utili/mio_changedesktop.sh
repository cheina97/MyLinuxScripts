#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Errore: aggiungere argomento R/L"
    exit
fi

x=$(xdotool get_desktop)

if [ "$1" == "R" ]; then
    let x++
    xdotool set_desktop $x 
elif [ "$1" == "L" ]; then
    let x--
    xdotool set_desktop $x
else
    echo "Errore: aggiungere argomento R/L"
fi
