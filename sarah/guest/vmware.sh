#!/bin/bash
# mount VMware Tools iso beforehand

sudo apt update

sudo apt install -y ansible
sudo chown -R -v `whoami` ~/.ansible

sudo apt install -y git

cd /media/`whoami`/VMware\ Tools

tar -zxvf `ls | grep *.tar.gz` -C ~/Downloads/

sudo ~/Downloads/vmware-tools-distrib/vmware-install.pl -d

sudo apt -y install open-vm-tools
sudo apt -y install open-vm-tools-desktop

sudo shutdown -r now
