
#Did not work from tty1
#https://unix.stackexchange.com/a/387405
#https://stackoverflow.com/questions/2609552/how-can-i-use-as-an-awk-field-separator
#disp_id="`ps e | grep -Po " DISPLAY=[\.0-9A-Za-z:]* " | sort -u | awk -F ':' '{print $NF}'`"
#echo "$disp_id"
#
##https://www.maketecheasier.com/restart-frozen-desktop-linux/
#killall xfwm4 &&
#  xfwm4 --replace --display=:$disp_id &&
#  disown

#https://askubuntu.com/a/215633
#pkill -KILL -u ${USER}

#https://askubuntu.com/a/610897
sudo systemctl restart lightdm



