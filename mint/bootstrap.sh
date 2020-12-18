#!/bin/bash

sudo su
apt install -y openssh-server
systemctl enable ssh.service
echo 'PermitEmptyPasswords yes' >> /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
sed -i 's|UsePAM yes|UsePam no|' /etc/ssh/sshd_config
systemctl restart ssh.service
