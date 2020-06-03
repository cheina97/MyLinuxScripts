#!/bin/bash
#!/bin/bash

datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo $(( (d1 - d2) / 86400 ))
}

curr=$(date +%F)

x=$(datediff $curr "2020-03-07")

h=$(date +%H)
m=$(date +%M)

if [ $h -lt 13 ] && [ $h -ge 6 ]; then
     echo "Buongiorno signor chenasso" |mio_parla
elif [ $h -ge 13 ] && [ $h -lt 18 ] ;then
     echo "Buonpomeriggio signor chenasso"|mio_parla
else
     echo "Buonasera signor chenasso"|mio_parla
fi
