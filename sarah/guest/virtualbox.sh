#!/bin/bash

echo "Virtualbox called"
sudo usermod -G vboxsf -a `whoami`
sudo reboot

