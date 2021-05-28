#!/bin/bash

#https://torlenor.org/linux/2020/10/31/mint_on_dell_xps_13.html
wget http://archive.ubuntu.com/ubuntu/pool/main/l/linux-meta-oem-5.6/linux-headers-oem-20.04_5.6.0.1056.52_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/l/linux-meta-oem-5.6/linux-image-oem-20.04_5.6.0.1056.52_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/l/linux-meta-oem-5.6/linux-oem-20.04_5.6.0.1056.52_amd64.deb
#wget http://archive.ubuntu.com/ubuntu/pool/main/l/linux-meta-oem-5.6/linux-tools-oem-20.04_5.6.0.1056.52_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/l/linux-firmware/linux-firmware_1.198_all.deb
sudo apt install ./linux-*

printf '
deb http://ppa.launchpad.net/somerville-dla-team/ppa/ubuntu bionic main
# deb-src http://ppa.launchpad.net/somerville-dla-team/ppa/ubuntu bionic main
# deb-src http://ppa.launchpad.net/somerville-dla-team/ppa/ubuntu bionic main
' > /etc/apt/sources.list.d/somerville-dla-team-ubuntu-ppa-bionic.list

printf '
deb http://oem.archive.canonical.com/ focal oem
#deb-src http://oem.archive.canonical.com/ focal oem
' > /etc/apt/sources.list.d/focal-oem.list

printf '
deb http://dell.archive.canonical.com/ focal somerville
# deb-src http://dell.archive.canonical.com/ focal somerville
deb http://dell.archive.canonical.com/ focal somerville-bulbasaur
# deb-src http://dell.archive.canonical.com/ focal somerville-bulbasaur
' > /etc/apt/sources.list.d/oem-somerville-bulbasaur-meta.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F992900E3BBF9275 F9FDA6BED73CDC22 F9FDA6BED73CDC22 78BD65473CB3BD13
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install ubuntu-oem-keyring oem-somerville-meta oem-somerville-bulbasaur-meta

#https://gist.github.com/gwillem/e14fe0eedf7625c31116ae0163943e2e
