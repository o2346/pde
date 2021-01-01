#!/bin/bash

sudo apt install -y git
sudo apt install -y dkms
git clone https://github.com/Dunedan/mbp-2016-linux.git
cd mbp-2016-linux
sudo git clone https://github.com/cb22/macbook12-spi-driver.git /usr/src/applespi-0.1
sudo dkms install -m applespi -v 0.1
sudo echo -e "\n# applespi\napplespi\nintel_lpss_pci\nspi_pxa2xx_platform" >> /etc/initramfs-tools/modules
sudo update-initramfs -u
gcc touchbar.c
sudo ./a.out -d /dev/bus/usb/001/002 1
