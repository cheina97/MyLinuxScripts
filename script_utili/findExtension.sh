#!/bin/bash

dirold=" "
find / -name "*."$1"" | while read line; do
    dir=$(dirname "$line")
    if [ "$dirold" != "$dir" ]; then
        echo $dir
        dirold=$dir
    fi
done >tmp

sort tmp>tmp2
uniq tmp2>dir
rm tmp tmp2
chmod 777 dir