#!/bin/bash
name=$1
max=$2
i=0

touch ~/Desktop/$name

while [ true ]; do
    sleep 1
    if [ "$(find ~/Desktop -regex ".*/"$name"[0-9]+" | wc -l)" -lt $max ]; then
        #let max=max*2
        echo mancante $max
        i=0
        while [ $i -lt $max ]; do
            if [ -e "$~/Desktop/"$name""$i"" ]; then
                let i++
                continue
            fi
            if [ ! -e $name ]; then 
                touch ~/Desktop/$name
            fi
            cp ~/Desktop/$name ~/Desktop/"$name""$i"
            let i++
        done
    fi
done




