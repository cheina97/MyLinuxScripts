#!/bin/bash

nome=$(echo "$HOSTNAME" | tr "a-z" "A-Z" )

s=$(date | tr "." " " | cut -d "C" -f 1 | tr , " "| tr -s " " )
    s1=$(echo $s|cut -d " " -f 1)
    s2=$(echo $s|cut -d " " -f 2)
    s3=$(echo $s|cut -d " " -f 3)
    s4=$(echo $s|cut -d " " -f 4)
    s5=$(echo $s|cut -d " " -f 5)
    s6=$(echo $s|cut -d " " -f 6)
    s7=$(echo $s|cut -d " " -f 7)
    text=$(echo "$s2 $s3 $s4 $s5:$s6:$s7")
oradata="$text"

RED='\033[1;33m'
GREEN='\033[1;31m'

printf "${GREEN}$nome\n"
printf "${RED}$oradata\n"
printf "${RED}$DESKTOP_SESSION $HOSTTYPE\n"
echo
