#!/bin/bash

DEVICE="20:DF:B9:2D:34:F1"

bluetoothctl << EOF
connect $DEVICE
quit
EOF
