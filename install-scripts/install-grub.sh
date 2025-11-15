#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

if [ -f "$SCRIPT_DIR/grub-themes/install.sh" ]; then
  echo -e "\n$Green Running grub theme installer $Reset"
  cd $SCRIPT_DIR/grub-themes/
  sudo bash "$SCRIPT_DIR/grub-themes/install.sh"
fi

cd $SCRIPT_DIR
