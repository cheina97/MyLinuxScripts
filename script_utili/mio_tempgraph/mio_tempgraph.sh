#!/bin/bash

if [ $# -eq 1 ]; then
     date=$1
elif [ $# -eq 0 ]; then
     date=`date +%d-%m-%y`
else
     echo "ERRORE: argomenti errati"
     exit
fi

echo "set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 1 pointtype 7 pointsize 0.5" > $HOME/.temperatura/script.gp

echo "set xdata time" >> $HOME/.temperatura/script.gp
echo "set timefmt \"%H:%M\"" >> $HOME/.temperatura/script.gp
echo "set format x \"%H:%M\"" >> $HOME/.temperatura/script.gp

echo "set yrange [30:100]" >> $HOME/.temperatura/script.gp
echo "set grid" >> $HOME/.temperatura/script.gp
echo "show grid" >> $HOME/.temperatura/script.gp
echo "plot \"$HOME/.temperatura/$date\" using 2:1 with linespoints linestyle 1, \"$HOME/.temperatura/$date\" using 2:3 with lines linewidth 2 lt rgb \"red\"" >> $HOME/.temperatura/script.gp
echo "pause -1" >> $HOME/.temperatura/script.gp

gnuplot -c $HOME/.temperatura/script.gp

rm $HOME/.temperatura/script.gp
