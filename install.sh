#!/bin/bash

getlinuxdir () {
  # https://pc.casey.jp/archives/153904527
  # doesn't work by command sh
  # /bin/sh -> dash problem
  # shell Syntax error: ( unexpected (expecting })
  declare -A dir
  dir=(["LinuxMint"]="mint" ["kali"]="kali" ["CentOS_release_6"]="centos6")

  for type in ${!dir[@]} ; do
    if echo `cat /etc/issue` | sed -e 's/\s/_/g' | grep -q $type ; then
      echo ${dir[$type]}
      return 0
    fi
  done

  for type in ${!dir[@]} ; do
    if echo `lsb_release -a 2>/dev/null` | sed -e 's/\s/_/g' | grep -q $type ; then
      echo ${dir[$type]}
      return 0
    fi
  done
}

getosdir () {
  if [ "$(uname)" = "Darwin" ]; then
    # Do something under Mac OS X platform
    echo "darwin"
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

preinstall_apt() {
  if [ -z `which ansible` ]; then
    sudo apt update
    sudo apt install -y ansible
    sudo chown -R -v $USER ~/.ansible
  fi

  sudo apt install -y git

  cd ~/Downloads
  git clone https://github.com/whateverjp/pde

}

preinstall_dnf() {
  echo hoge
}

preinstall_brew() {

  if [ -z `which brew` ]; then
    sudo xcodebuild -license
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
  fi
  if [ -z `which ansible` ]; then
    brew install ansible
  fi
  if [ -z `which git` ]; then
    brew install git
  fi

  cd ~/Downloads
  git clone https://github.com/whateverjp/pde

}

preinstall() {
  if [ "$(uname)" = "Darwin" ]; then
    echo "preinstall for macos"
    preinstall_brew
  elif which apt 2>/dev/null; then
    # Do something under GNU/Linux platform
    preinstall_apt
  elif which dnf 2>/dev/null; then
    # Do something under GNU/Linux platform
    preinstall_dnf
  fi
}

OSDIR=`getosdir`
USER=`whoami`


# switch playbook for master or test
while getopts "devi" OPT ; do
  case $OPT in
    d)  echo Branch: Develop OSDIR=$OSDIR
        preinstall
        cd ~/Downloads/pde
        git checkout develop
        git pull
        cd ~/Downloads/pde/$OSDIR
        sh ~/Downloads/pde/$OSDIR/ansible.sh
        ;;
    e)  echo Branch: Develop OSDIR=$OSDIR
        preinstall
        cd ~/Downloads/pde
        git checkout develop
        git pull
        cd ~/Downloads/pde/$OSDIR
        sh ~/Downloads/pde/$OSDIR/ansible.sh -e
        ;;
    v)  echo Virtual Machine Optimization mode OSDIR=$OSDIR
        vmopt
        exit 0
        ;;
    i)  echo init mode
        preinstall
        cd ~/Downloads/pde
        git checkout develop
        git pull
        cd ~/Downloads/pde/$OSDIR
        echo INIT
        echo `pwd`
        echo $OSDIR
        sh ~/Downloads/pde/$OSDIR/ansible.sh -i
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

