#!/bin/bash

sudo su
apt install -y openssh-server
systemctl enable ssh.service
sshconf=/etc/ssh/sshd_config
permit_empty='PermitEmptyPasswords yes'
permit_root='PermitRootLogin yes'
if ! cat $sshconf | grep $permit_empty; then
  echo "$permit_empty"  >> $sshconf
fi
if ! cat $sshconf | grep $permit_root; then
  echo "$permit_root"  >> $sshconf
fi

sed -i 's|UsePAM yes|UsePam no|' /etc/ssh/sshd_config
systemctl restart ssh.service
