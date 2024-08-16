#!/bin/bash
#https://opensource.com/article/18/11/how-swap-ctrl-and-caps-lock-your-keyboard
/usr/bin/setxkbmap -option "ctrl:nocaps"
#https://askubuntu.com/questions/271387/how-to-restart-wifi-connection/271739#271739
sudo ifconfig wlan0 up
