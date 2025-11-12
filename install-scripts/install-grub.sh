#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")

if [ -f "$SCRIPT_DIR/../grub-themes/install.sh" ]; then
  echo "Running grub theme installer..."
  cd $SCRIPT_DIR/../grub-themes/
  sudo bash "$SCRIPT_DIR/../grub-themes/install.sh"
fi
