#!/bin/bash



youtube-dl -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata --metadata-from-title "%(artist)s - %(title)s" $1

