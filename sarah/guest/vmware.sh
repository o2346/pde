#!/bin/bash
# mount VMware Tools iso beforehand

sudo apt update
#sudo apt dist-upgrade -y
#sudo apt install -y build-essential linux-headers-$(uname -r)

sudo apt install -y ansible
sudo chown -R -v `whoami` ~/.ansible

sudo apt install -y git

if [ -n "`cat /var/log/vmware-install.log | grep VMware\ Tools\ installed`" ]; then
  echo "VMware Tool already installed. Abort"
  exit 0
fi

cd /media/`whoami`/VMware\ Tools

tar -zxvf `ls | grep *.tar.gz` -C ~/Downloads/

sudo perl ~/Downloads/vmware-tools-distrib/vmware-install.pl -d

sudo apt install -y open-vm-tools
sudo apt install -y open-vm-tools-desktop

sudo shutdown -r now

