#!/bin/bash

apt-get install git dkms

cd ~
echo -e "\n# macbook12-spi-drivers\napplespi\nappletb\nspi_pxa2xx_platform\nintel_lpss_pci" >> /etc/initramfs-tools/modules

cd `mktemp -d`
git clone https://github.com/roadrunner2/macbook12-spi-driver.git
cd ./macbook12-spi-driver
git checkout touchbar-driver-hid-driver
dkms add .
dkms install -m applespi -v 0.1

# lsinitramfs /boot/initrd.img-4.13.0-36-generic | grep -iE "appletb|applespi"
lib/modules/4.13.0-36-generic/updates/dkms/appletb.ko
lib/modules/4.13.0-36-generic/updates/dkms/applespi.ko
