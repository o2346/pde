#!/bin/bash

getlinuxdir () {
  # https://pc.casey.jp/archives/153904527
  # doesn't work by command sh
  # /bin/sh -> dash problem
  # shell Syntax error: ( unexpected (expecting })
  declare -A dir
  dir=(["Sarah"]="sarah" ["serena"]="sarah" ["LinuxMint"]="sarah")

  for type in ${!dir[@]} ; do
    if echo `lsb_release -a` | grep -q $type ; then
      echo ${dir[$type]}
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

vmx() {
  echo "[Hypervisor Detection] $1 is the one virtualizes this machine. proceeding..."
  sh ~/Downloads/pde/`getosdir`/guest/vmware.sh
}

vbox() {
  echo "[Hypervisor Detection] $1 is the one virtualizes this machine. proceeding..."
  sh ~/Downloads/pde/`getosdir`/guest/virtualbox.sh
}

vmopt() {
  HYPERV=`sudo dmidecode -s system-product-name`

  if [ "$HYPERV" = "VirtualBox" ]; then
    vbox $HYPERV
    return 0
  fi

  if [ "$HYPERV" = "VMware Virtual Platform" ]; then
    vmx $HYPERV
    return 0
  fi

  echo "[ERROR] This machine likely has none of Hypervisor. abort"
  return 1

}

preinstall(){
  sudo apt update

  sudo apt install -y ansible
  sudo chown -R -v $USER ~/.ansible

  sudo apt install -y git

  cd ~/Downloads
  git clone http://github.com/whateverjp/pde

}

OSDIR=`getosdir`
USER=`whoami`


# switch playbook for master or test
while getopts "dev" OPT ; do
  case $OPT in
    d)  echo Branch: Develop OSDIR=$OSDIR
        preinstall
        cd ~/Downloads/pde
        git checkout develop
        cd ~/Downloads/pde/$OSDIR
        sh ~/Downloads/pde/$OSDIR/ansible.sh
        ;;
    e)  echo Branch: Develop OSDIR=$OSDIR
        preinstall
        cd ~/Downloads/pde
        git checkout develop
        cd ~/Downloads/pde/$OSDIR
        sh ~/Downloads/pde/$OSDIR/ansible.sh -e
        ;;
    v)  echo Virtual Machine Optimization mode OSDIR=$OSDIR
        vmopt
        exit 0
        ;;
  esac
done

# without arguments
if [ $# -eq 0 ] ; then
  echo Branch: Master OSDIR=$OSDIR
  preinstall
  cd ~/Downloads/pde/$OSDIR
  sh ~/Downloads/pde/$OSDIR/ansible.sh
fi

