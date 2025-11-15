#!/bin/bash

echo -e "\n$Green Installing walker and elepant $Reset"

yay -S --needed --noconfirm \
  walker-bin elephant elephant-desktopapplications \
  elephant-calc elephant-runner elephant-files elephant-providerlist elephant-websearch elephant-clipboard \
  elephant-symbols elephant-unicode elephant-emojis elephant-todo elephant-bluetooth
