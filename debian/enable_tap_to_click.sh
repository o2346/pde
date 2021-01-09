#!/bin/bash

#https://askubuntu.com/questions/403113/how-do-you-enable-tap-to-click-via-command-line
declare -r touchpad="`xinput list --name-only | grep -i touchpad | head -n 1`"
xinput list-props "$touchpad"
xinput set-prop "$touchpad" "libinput Tapping Enabled" 1
#need default?
#sudo xinput set-prop "$touchpad" "libinput Tapping Enabled Default" 1
#        libinput Tapping Enabled Default (817): 0

