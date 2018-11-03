#!/bin/bash

# enable wifi or internet con beforhand
sudo dnf install -y git
sudo dnf install -y dkms
sudo dnf install -y make
dmidecode | grep -i macbook
yum update kernel
dnf install kernel-devel kernel-headers dkms git
echo -e "\nadd_drivers+=\"applespi intel_lpss_pci spi_pxa2xx_platform\"" > /etc/dracut.conf.d/applespi.conf

cd `mktemp -d`

#https://github.com/cb22/macbook12-spi-driver
#echo -e "\n# applespi\napplespi\nspi_pxa2xx_platform\nspi_pxa2xx_pci" >> /etc/initramfs-tools/modules

git clone https://github.com/cb22/macbook12-spi-driver.git /usr/src/applespi-0.1
dkms install -m applespi -v 0.1
modprobe applespi
