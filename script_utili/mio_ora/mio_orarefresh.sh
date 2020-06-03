#!/bin/bash

while [ 0 ]; do
    t1=$(sensors|grep temp1 | head -3|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
    t2=$(sensors|grep temp1 | head -4|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
    t3=$(sensors|grep temp1 | head -5|tail -1|tr -s " "|cut -f 2 -d " "|cut -d "." -f1|cut -d "+" -f2)
    t=$t1; 
    if [ $t2 -gt $t ]; then
        t=$t2
    fi
    if [ $t3 -gt $t ]; then
        t=$t3
    fi


    echo -e "\n"
    s=$(date | tr ":" " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
    s1=$(echo $s|cut -d " " -f 1)
    s2=$(echo $s|cut -d " " -f 2)
    s3=$(echo $s|cut -d " " -f 3)
    s4=$(echo $s|cut -d " " -f 4)
    s5=$(echo $s|cut -d " " -f 5)
    s6=$(echo $s|cut -d " " -f 6)
    s7=$(echo $s|cut -d " " -f 7)

    echo -e "$s1 $s2 $s3 $s4\n$s5 : $s6 : $s7\nTemp : $t" | figlet -c

    sleep 1s
    clear
done
