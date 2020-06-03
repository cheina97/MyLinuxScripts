#!/bin/bash

icon=/home/cheina/Pictures/icons/clock.png

text=$(uptime -p)
zenity --notification --window-icon="$icon" --text "$text"
#mio_beep 2  
