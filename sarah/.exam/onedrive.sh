#!/bin/bash

# https://memo.laughk.org/2016/12/22/0000.html
# https://github.com/skilion/onedrive
sudo apt-get install -y libcurl-dev
sudo apt-get install -y libsqlite3-dev
sudo wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
wget -qO - http://dlang.org/d-keyring.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y dmd-bin
# https://ubuntuforums.org/showthread.php?t=1774516
sudo apt-get install -y libcurl4-gnutls-dev

cd ~/Downloads
git clone https://github.com/skilion/onedrive && cd  onedrive
make
sudo make install

mkdir -p ~/.config/onedrive
cp /usr/local/etc/onedrive.conf ~/.config/onedrive/config

systemctl --user enable onedrive
systemctl --user start onedrive

