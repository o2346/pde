#!/bin/bash

# enable wifi or internet con beforhand
sudo apt install -y git
cd `mktemp -d`

#https://github.com/cb22/macbook12-spi-driver
echo -e "\n# applespi\napplespi\nspi_pxa2xx_platform\nspi_pxa2xx_pci" >> /etc/initramfs-tools/modules

sudo apt install -y dkms
rm -rf /usr/src/applespi-0.1
git clone https://github.com/cb22/macbook12-spi-driver.git /usr/src/applespi-0.1
dkms install -m applespi -v 0.1
