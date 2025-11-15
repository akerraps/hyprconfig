#!/bin/bash

echo -e "\n$Green Updating profile image $Reset"

SCRIPT_DIR=$(dirname "$(realpath "$0")")

sudo cp $SCRIPT_DIR/resources/akerraps.jpg /usr/share/sddm/faces/akerraps.face.icon
