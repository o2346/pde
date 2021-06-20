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
  /opt/onwakeup/onwakeup.sh
fi
