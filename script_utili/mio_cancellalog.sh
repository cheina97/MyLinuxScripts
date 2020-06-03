#/bin/bash

path="/var/log"

chmod 777 $path/wtmp
chmod 777 $path/btmp

>$path/wtmp
>$path/btmp

chmod 644 $path/wtmp
chmod 600 $path/btmp