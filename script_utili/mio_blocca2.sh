#!/bin/bash
dir=$HOME/Pictures/fotoblocco
mkdir -p "$dir"
rm "$dir"/*

dde-lock &> /dev/null &

p1=" ";

while [ 0 ]; do
    if [ "$p1" == " " ]; then
        p1=$(mio_scattafoto "$dir")
        echo $p1
    else
        p2=$(mio_scattafoto "$dir")
        echo $p2
        r=$(mio_compare $p1 $p2 1 2>&1)
        echo $r
        if [ $r -lt 50 ];then
            rm $p2
            echo "ELIMINATO: $p2"
        else
            p1=$p2;
        fi
    fi
    sleep 2s
done
