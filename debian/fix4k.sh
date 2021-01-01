#!/bin/bash
#This is to set refresh rate 60Hz as expected
#usage:
#test -f "~/.xprofile" || % > ~/.xprofile
#https://wiki.debian.org/Xsession

#In my case I use this 4k monitor but refresh rate was unexpectedly limited to 30 Hz in default on Linux mint.
#http://japannext.net/jn-vt500uhd-4k-%E6%9B%B2%E9%9D%A2%E3%83%A2%E3%83%8B%E3%82%BF%E3%83%BC-50%E5%9E%8B-uhd%E3%83%87%E3%82%A3%E3%82%B9%E3%83%97%E3%83%AC%E3%82%A4-hdmi2-0-hdcp2-2-japannext/
#They say the monitor support 60Hz
# GPU: AMD ATI Radeon RX 5600 OEM/5600 XT

#memo
#https://askubuntu.com/questions/1260809/cant-get-4k-60hz-only-30hz
#https://www.google.co.jp/search?safe=off&num=24&hl=en&q=gdbus.error%3Aorg.gtk.gdbus.unmappedGerror.quark._gnome_2drr_2derror_2dquark.Code2%3A+could+not+set+the+configuration+for+CRTC+79

if test -z "$1"; then
  # Assuming the 4k is already connected and no conflicts, no matter primary or not
  display_port="`xrandr | grep -E 'connected[[:space:]].*3840x2160' | awk '{print $1}'`"
  # It should be something like HDMI-A-3
else
  display_port="$1"
  #xrandr --output $display_port --primary
  #https://askubuntu.com/a/449183
fi

mode_content="`cvt 3840 2160 -r | grep -E '^Modeline' | cut -d\  -f2-`"
# It should be something like:
#"3840x2160R"  533.00  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync
#cvt without '-r' did not work

mode_id="`echo $mode_content | awk '{print $1}'`"

echo "$mode_content" >&2
echo "$display_port" >&2
echo "$mode_id" >&2

if [ -z "$mode_content" ]; then
  echo "[ERROR] mode_content is empty" >&2
  exit 1
fi
if [ -z "$display_port" ]; then
  echo "[ERROR] display_port is empty" >&2
  exit 1
fi

echo "xrandr --newmode $mode_content"
echo "xrandr --addmode $display_port $mode_id"
#echo "xrandr --output $display_port --mode $mode_id"

exit 0

#echo "$display_port $mode_content" >&2
#xrandr --addmode $display_port $mode_id
#xrandr --output $display_port --mode "$mode_id"

