#!/bin/bash

arp|while read line; do 
    line=$(echo $line|cut -f 1 -d " ")
    arp -d $line
done

echo "arp deleted"