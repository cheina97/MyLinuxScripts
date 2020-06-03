#!/bin/bash

wget -q --spider http://google.com
connection_state=$?

echo -e "INTERFACCIA|IP|NETMASK|BROADCAST|">$HOME/mio_iptmp.txt
ifconfig |grep flags|cut -d : -f 1| while read line; do
    ip=$(ifconfig $line| grep "inet "| tr -s " "| cut -d " " -f 3)
    mask=$(ifconfig $line| grep "inet "| tr -s " "| cut -d " " -f 5)
    br=$(ifconfig $line| grep "inet "| tr -s " "| cut -d " " -f 7)
    echo "$line|$ip|$mask|$br">>$HOME/mio_iptmp.txt
done

if [ $connection_state == 0 ]; then
    ip=$(curl -s https://api.ipify.org)
    echo "pubblico|$ip" >>$HOME/mio_iptmp.txt
fi

column $HOME/mio_iptmp.txt -t -s "|"
rm $HOME/mio_iptmp.txt

