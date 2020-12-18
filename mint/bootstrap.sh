#!/bin/bash

# Enable ssh etc for guest VMs on local development purpose. Beware what would be done
# curl https://raw.githubusercontent.com/o2346/pde/develop/mint/bootstrap.sh | bash -s
sudo passwd -d `whoami`
sudo apt install -y openssh-server
systemctl enable ssh.service
sshconf=/etc/ssh/sshd_config
permit_empty='PermitEmptyPasswords yes'
permit_root='PermitRootLogin yes'
if [ "`cat $sshconf | grep '$permit_empty'`" = "" ] ; then
  echo "$permit_empty"  >> $sshconf
fi
if [ "`cat $sshconf | grep '$permit_root'`" = "" ] ; then
  echo "$permit_root"  >> $sshconf
fi

sed -i 's|UsePAM yes|UsePam no|' /etc/ssh/sshd_config
systemctl restart ssh.service
