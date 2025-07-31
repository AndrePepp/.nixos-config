#!/usr/bin/env bash

threshold=300
STATEFILE="/tmp/shiftWorkspace"
currentWorkspace=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print $3}')
currentTime=$(date +%s%3N)

if [[ -f $STATEFILE ]]; then
        lastTime=$(cat $STATEFILE)
        delta=$((currentTime-lastTime))
        if [[ delta -lt threshold ]]; then
                hyprctl dispatch workspace $((currentWorkspace - 1))
                rm $STATEFILE
                exit
        fi
fi

touch $STATEFILE
echo $currentTime > $STATEFILE




