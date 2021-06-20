#!/bin/bash
#https://www.addictivetips.com/ubuntu-linux-tips/run-scripts-and-commands-on-suspend-and-resume-on-linux/
#For laptop
#Place this script at  /usr/lib/systemd/system-sleep/

if [ "${1}" == "pre" ]; then
  :
fi

if [ "${1}" == "post" ]; then
  date > /tmp/postsuspend.log
  uuidgen >> /tmp/postsuspend.log
  #https://opensource.com/article/18/11/how-swap-ctrl-and-caps-lock-your-keyboard
  /usr/bin/setxkbmap -option "ctrl:nocaps"
  #https://askubuntu.com/questions/271387/how-to-restart-wifi-connection/271739#271739
  sudo ifconfig wlan0 up
fi
