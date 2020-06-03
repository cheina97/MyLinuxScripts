#!/bin/bash
if [ $# -ne 1 ]; then
    echo "ERRORE: inserire fps (consigliati 24)"
    exit
fi
ffmpeg -r $1 -pattern_type glob -i '*.jpeg'  -vcodec libx264  timelapse.mp4


