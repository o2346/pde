#!/bin/bash

#https://wiki.debian.org/PulseAudio
#https://wiki.debian.org/SoundConfiguration
#https://wiki.debian.org/Sound?action=show&redirect=SoundFAQ#Troubleshooting

#package
sudo apt install -y alsa-utils

#Investicate devices
#https://www.google.co.jp/search?safe=off&num=24&hl=en&q=debian+detect+sound+device+-naver+-cookpad+-nikkeibp+-rakuten+-weblio+-slideshare+-zdnet+-mynavi+-qiita+-lomography+-photohito.com
lspci -knn | grep -i audio
aplay -l
systemctl --user status pulseaudio
#https://superuser.com/a/1311481
pacmd list-cards

#https://www.google.co.jp/search?safe=off&num=24&hl=en&q=kali+sound+settings+-naver+-cookpad+-nikkeibp+-rakuten+-weblio+-slideshare+-zdnet+-mynavi+-qiita+-lomography+-photohito.com
#https://www.maketecheasier.com/fix-sound-kali-linux/

#https://www.youtube.com/watch?v=mA4XfeziM4Y
#The command from the TXT file is:
curl -s https://raw.githubusercontent.com/nu11secur1ty/pulseaudio/master/pulseaudio.sh | bash
#BTW, it's worked for me (19.4) :)

#https://www.youtube.com/watch?v=xUda6s6jkBY
#/etc/pulse/daemon.conf
#Procedures : 
#Step 1 : open daemon.conf in pulse directory structure 
#/etc/pulse/daemon.conf by gedit or leafpad.
#open terminal and type :
#gedit /etc/pulse/daemon.conf
#Step 2: change the value of daemonize = yes .
#Save the file and close it.
#Step 3 : type on terminal : 
systemctl --user enable pulseaudio
systemctl --user start pulseaudio
#Step 4 : At last step, audio will be working.
#Incase not, just type in terminal :
#reboot now
