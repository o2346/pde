#!/bin/sh

sudo apt-get update
sudo apt-get remove --purge -y libreoffice*
sudo apt-get remove --purge -y gimp*
sudo apt-get clean -y
sudo apt-get autoremove -y

sudo apt-get install -y git
sudo apt-get install -y ansible

