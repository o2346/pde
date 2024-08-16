#!/bin/bash
#No use for systemd, unable to connect X server
#tail -f /var/log/syslog | while read f; do

#without requireing sudo
#https://askubuntu.com/a/166438
(\
udevadm monitor --udev | while read f; do
  bus_no=`lsusb | grep 'Kensington SlimBlade Trackball' | awk '{print $2}' | bc`
  if echo $f | grep "usb${bus_no}" > /dev/null; then
    echo "Trackball might be Connected!!"
    while ! /usr/bin/xinput list 'Kensington Kensington Slimblade Trackball'; do
      sleep 2
      echo "still waiting.."
    done
    /usr/bin/xinput set-button-map "Kensington Kensington Slimblade Trackball" 3 3 1 5 4 6 7 1 9 10 11 12 &&
    /usr/bin/xinput  --set-prop  "Kensington Kensington Slimblade Trackball" "libinput Accel Speed" -1    &&
    echo "Trackball Configured"
  fi
  sleep 4
done \
) &
