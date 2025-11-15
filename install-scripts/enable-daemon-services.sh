#!/bin/bash

echo -e "\n$Green Enabling daemon services $Reset"

elephant service enable
sudo systemctl enable reflector
