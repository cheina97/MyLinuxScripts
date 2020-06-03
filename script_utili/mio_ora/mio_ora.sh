#!/bin/bash

s=$(date | tr "." " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
s1=$(echo $s|cut -d " " -f 1)
s2=$(echo $s|cut -d " " -f 2)
s3=$(echo $s|cut -d " " -f 3)
s4=$(echo $s|cut -d " " -f 4)
s5=$(echo $s|cut -d " " -f 5)
s6=$(echo $s|cut -d " " -f 6)
s7=$(echo $s|cut -d " " -f 7)

echo -e "$s1 $s2 $s3 $s4\n$s5 : $s6 : $s7" | figlet