#!/bin/bash

while getopts "e" OPT ; do
  case $OPT in
    e)  echo Entering Examinational mode
        ansible-playbook exam.yml -kK --connection=local
        ;;
  esac
done

if [ $# -eq 0 ] ; then
  echo Entering Normal mode
  ansible-playbook install.yml -kK --connection=local
fi

