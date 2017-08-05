#!/bin/bash
cd `dirname $0`
while getopts "ei" OPT ; do
  case $OPT in
    e)  echo Entering Examinational mode
        ansible-playbook exam.yml -kK --connection=local
        ;;
    i)  echo playing init mode
        ansible-playbook init.yml -kK --connection=local
        ;;
  esac
done

if [ $# -eq 0 ] ; then
  echo Entering Normal mode
  ansible-playbook install.yml -kK --connection=local
fi

