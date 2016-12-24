#!/bin/bash

getlinuxdir () {
  declare -A dir
  dir=(["sarah"]="Sarah")

  for type in ${!dir[@]} ; do
    if echo `lsb_release -a` | grep -q ${dir[$type]} ; then
      echo $type
    fi
  done
}

getosdir () {
  if [ "$(uname)" = "Darwin" ]; then
    # Do something under Mac OS X platform
    echo "$(uname)"
  elif [ "$(uname)" = "Linux" ]; then
    # Do something under GNU/Linux platform
    echo `getlinuxdir`
  elif [ "$(expr substr $(uname -s) 1 10)" = "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    return "$(expr substr $(uname -s) 1 10)"
  fi
}

OSDIR=`getosdir`
USER=`whoami`

sudo apt update

sudo apt install -y ansible
sudo chown -R -v $USER ~/.ansible

sudo apt install -y git

cd ~/Downloads
git clone http://github.com/whateverjp/cm

# switch playbook for master or test
while getopts "de" OPT ; do
  case $OPT in
    d)  echo Branch: Develop
        cd ~/Downloads/cm
        git checkout develop
        cd ~/Downloads/cm/pde/$OSDIR
        sh ansible.sh
        ;;
    e)  echo Branch: Develop
        cd ~/Downloads/cm
        git checkout develop
        cd ~/Downloads/cm/pde/$OSDIR
        sh ansible.sh -e
        ;;
  esac
done

# without arguments
if [ $# -eq 0 ] ; then
  echo Branch: Master
  sh ~/Downloads/cm/pde/$OSDIR/ansible.sh
  rm -rf ~/Downloads/cm
fi

# TODO for automatic switch by distro, command below would helpful
# lsb_release -a
