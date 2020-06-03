#!/bin/bash

h=$(date +%H)
m=$(date +%M)

if [ $h -ge 22 ] || [ $h -le 7 ]; then
     echo "Buonanotte signor chenasso"|mio_parla
elif [ $h -ge 17 ] && [ $h -le 21 ]; then
     echo "Buonaserata signor chenasso"|mio_parla
else
     echo "Buona giornata signor chenasso"|mio_parla
fi
poweroff
