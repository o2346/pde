#!/bin/bash

vmx() {
  echo vmx called
}


vbox() {
  echo vbox called
}


vmopt() {
  VBOX=`ls /dev | grep vbox`
  VMX=`ls /dev | grep vmci`

  if [ -n "$VBOX" -a -n "$VMX" ]; then
    echo "[ERROR] this is likely a host machine. abort"
    return 1
  fi

  if [ -n "$VBOX" ]; then
    vbox
    return 0
  fi

  if [ -n "$VMX" ]; then
    vmx
    return 0
  fi

}

getlinuxdir () {
  # https://pc.casey.jp/archives/153904527
  # doesn't work by command sh
  # /bin/sh -> dash problem
  # shell Syntax error: ( unexpected (expecting })
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

while getopts "v" OPT ; do
  case $OPT in
    v)  echo Virtual Machine Optimization mode
        vmopt
        ;;
  esac
  exit 0
done

OSDIR=`getosdir`
USER=`whoami`

sudo apt update

sudo apt install -y ansible
sudo chown -R -v $USER ~/.ansible

sudo apt install -y git

cd ~/Downloads
git clone http://github.com/whateverjp/pde

# switch playbook for master or test
while getopts "de" OPT ; do
  case $OPT in
    d)  echo Branch: Develop
        cd ~/Downloads/pde
        git checkout develop
        cd ~/Downloads/pde/$OSDIR
        sh ansible.sh
        ;;
    e)  echo Branch: Develop
        cd ~/Downloads/pde
        git checkout develop
        cd ~/Downloads/pde/$OSDIR
        sh ansible.sh -e
        ;;
  esac
done

# without arguments
if [ $# -eq 0 ] ; then
  echo Branch: Master
  cd ~/Downloads/pde/$OSDIR
  sh ansible.sh
fi

