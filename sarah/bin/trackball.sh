#!/bin/bash
logger "trackball custom setting"
/usr/bin/xinput set-button-map "Kensington Kensington Slimblade Trackball" 3 3 1 5 4 6 7 1 9 10 11 12 | logger
/usr/bin/xinput  --set-prop  "Kensington Kensington Slimblade Trackball" "Device Accel Constant Deceleration" 4 | logger
logger "done"

