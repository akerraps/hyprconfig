#!/bin/bash

MONITOR="HDMI-A-1"

while true; do

    if ! pgrep -x "hyprpanel" > /dev/null; then
        hyprpanel &
    fi

  sleep 2
done
