#!/bin/bash

echo -n inserisci nome:
read name

echo -n inserisci numero:
read max

let max=max/2

./replicant.sh $name $max &

echo Lanciato