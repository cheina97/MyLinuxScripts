#!/bin/bash

mkdir -p $HOME/Pictures/fotoloop
rm $HOME/Pictures/fotoloop/*

i=0
while [ 0 ]; do
    mio_scattafoto $HOME/Pictures/fotoloop
    sleep 2s
done
