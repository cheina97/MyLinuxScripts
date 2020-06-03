#!/bin/bash

if [ $# -eq 1 ]; then
     date=$1
elif [ $# -eq 0 ]; then
     date=`date +%d-%m-%y`
else
     echo "ERRORE: argomenti errati"
     exit
fi

cat $HOME/.temperatura/*|sort -k 2 > $HOME/.temperatura/tmp
echo "0 0 0" >> $HOME/.temperatura/tmp #per processare ultima riga

hm_last="vuoto"
sum=0
i=0
cat $HOME/.temperatura/tmp| while read t hm l; do
     if [ "$hm" != "$hm_last" ]; then
          if [ $sum -ne 0 ]; then
               m=$(bc -l<<<$sum/$i)
               echo "$m $hm_last $i" >> $HOME/.temperatura/media
          fi
          hm_last=$hm
          i=1;
          sum=$t
     else
          let i++
          let sum=sum+$t
     fi
     
done


rm $HOME/.temperatura/tmp


echo "set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 1 pointtype 7 pointsize 0.5" > $HOME/.temperatura/script.gp

echo "set xdata time" >> $HOME/.temperatura/script.gp
echo "set timefmt \"%H:%M\"" >> $HOME/.temperatura/script.gp
echo "set format x \"%H:%M\"" >> $HOME/.temperatura/script.gp

echo "set yrange [30:100]" >> $HOME/.temperatura/script.gp
echo "set grid" >> $HOME/.temperatura/script.gp
echo "show grid" >> $HOME/.temperatura/script.gp

echo "plot \"$HOME/.temperatura/media\" using 2:1 with linespoints linestyle 1" >> $HOME/.temperatura/script.gp
echo "pause -1" >> $HOME/.temperatura/script.gp

echo "set terminal qt 1" >> $HOME/.temperatura/script.gp
echo "plot \"$HOME/.temperatura/media\" using 2:1 with points linestyle 1" >> $HOME/.temperatura/script.gp
echo "pause -1" >> $HOME/.temperatura/script.gp

gnuplot -c $HOME/.temperatura/script.gp

rm $HOME/.temperatura/script.gp
rm $HOME/.temperatura/media
