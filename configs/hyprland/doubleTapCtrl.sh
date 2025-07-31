#!/usr/bin/env bash

threshold=300
SAVEFILE="/tmp/doubleCtrlWorkspace"
currentTime=$(date +%s%3N)
currentWorkspace=$(hyprctl activeworkspace | grep "workspace ID" | awk {'print $3'})

if [[ -f $SAVEFILE ]]; then
        lastTime=$(cat $SAVEFILE)
        delta=$((currentTime - lastTime))
        if [[ $delta -lt $threshold ]]; then
                hyprctl dispatch workspace $((currentWorkspace + 1))
                rm $SAVEFILE
                exit
        fi
fi

echo $currentTime > $SAVEFILE
