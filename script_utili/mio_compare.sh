#!/bin/bash

ris=$(compare -metric AE -fuzz 8% $1 $2 compare.png)
echo $ris

