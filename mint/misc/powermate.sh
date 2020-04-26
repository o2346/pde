#!/bin/bash

#https://github.com/stefansundin/powermate-linux
#http://wirefall.dyndns.org/powermate.html
#https://www.amazon.co.jp/dp/B003VWU2WA/ref=cm_sw_r_tw_dp_U_x_tiaPEb37ZY7EZ
#https://www.google.com/search?q=griffin+technology+na16029+powermate+usb+multimedia+controller+linux

# Register this script to like 'Startup Application' on your system

cd /var/tmp

if ! ls powermate-linux; then
  git clone --recurse-submodules https://github.com/stefansundin/powermate-linux.git
fi
cd powermate-linux
if [ -f "./powermate" ]; then
  :
else
  sudo cp 60-powermate.rules /etc/udev/rules.d/
  sudo apt-get install -y libpulse-dev libnotify-dev
  sudo apt-get update --fix-missing
  make
fi

ps aux | grep 'powermate \-d' | awk '{print $2}' | xargs kill
./powermate -d -c `dirname $0`/powermate.toml

#if ps aux | grep "powermate \-d"; then
#  echo "It's already running. Abort" >&2
#else
#  ./powermate -d
#fi
