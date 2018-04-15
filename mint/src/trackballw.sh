#!/bin/bash
tail -f /var/log/syslog | while read f; do
  if echo $f | grep "input: Kensington Kensington Slimblade Trackball" > /dev/null; then
    echo "Trackball Connected!!"
    sleep 1
    /usr/bin/xinput set-button-map "Kensington Kensington Slimblade Trackball" 3 3 1 5 4 6 7 1 9 10 11 12 | logger
    /usr/bin/xinput  --set-prop  "Kensington Kensington Slimblade Trackball" "Device Accel Constant Deceleration" 4 | logger
  fi
done
