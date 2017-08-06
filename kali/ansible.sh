#!/bin/bash

if [ -z `which ansible` ]; then
  curl https://raw.githubusercontent.com/whateverjp/pde/develop/kali/sources.list > /etc/apt/sources.list
  apt update
  apt install -y ansible
  sudo chown -R -v $USER ~/.ansible
fi

while getopts "ei" OPT ; do
  case $OPT in
    e)  echo Entering Examinational mode
        ansible-playbook exam.yml -kK --connection=local
        ;;
    i)  echo Entering Examinational mode
        ansible-playbook init.yml -kK --connection=local
        ;;
  esac
done

if [ $# -eq 0 ] ; then
  echo Entering Normal mode
  ansible-playbook install.yml -kK --connection=local
fi

