#!/bin/bash

if [ $# -eq 1 ]; then
     date=$1
elif [ $# -eq 0 ]; then
     date=`date +%d-%m-%y`
else
     echo "ERRORE: argomenti errati"
     exit
fi

cat $HOME/.temperatura/* | cut -d " " -f 1,2 | sort -k 2| uniq -c > $HOME/.temperatura/total

echo "set xdata time" >> $HOME/.temperatura/script.gp
echo "set timefmt \"%H:%M\"" >> $HOME/.temperatura/script.gp
echo "set format x \"%H:%M\"" >> $HOME/.temperatura/script.gp

echo "set yrange [30:100]" >> $HOME/.temperatura/script.gp
echo "set grid" >> $HOME/.temperatura/script.gp
echo "show grid" >> $HOME/.temperatura/script.gp

echo "set palette defined ( 0 \"pink\", 1 \"purple\", 2 \"dark-blue\") " >> $HOME/.temperatura/script.gp

echo "plot \"$HOME/.temperatura/total\" using 3:2:1 with points pointtype 7 pointsize 0.5 lt palette" >> $HOME/.temperatura/script.gp
echo "pause -1" >> $HOME/.temperatura/script.gp

gnuplot -c $HOME/.temperatura/script.gp

rm $HOME/.temperatura/script.gp
rm $HOME/.temperatura/total
