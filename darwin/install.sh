#!/bin/bash

# appleid required beforhand
#xcode-select --install

# homebrew install
# http://brew.sh/index_ja.html
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade

brew install git

brew install caskroom/cask/brew-cask

brew tap rcmdnk/file
brew install brew-file

brew install wget
brew install ansible
brew install nmap
brew install wireshark --with-qt
brew install awscli
brew install htop

brew install nkf
brew install diff-pdf

brew install trash

brew install macvim --override-system-vim

brew install tmux
brew install reattach-to-user-namespace
brew install rename
brew cask install iterm2

brew cask install google-chrome
brew cask install firefox
brew cask install virtualbox
brew cask install vagrant
brew cask install dropbox
brew cask install skitch
brew cask install google-japanese-ime
brew cask install filezilla
brew cask install keepassx
brew cask install vlc
brew cask install sourcetree

# xtrafinder normally unavailable on El Capitan
# with Configuring System Integrity Protection
# brew cask install xtrafinder

brew cask install libreoffice
brew cask install p4merge
brew cask install diffmerge
brew cask install macdown
brew cask install openoffice
brew cask install atom
brew install ffmpeg --with-tools

brew install Caskroom/cask/xquartz
brew install fontforge
brew install wine

vagrant plugin list
vagrant plugin install vagrant-aws

# show hidden files and directorys
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# install DotFiles

# NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
vim +NeoBundleInstall +qall

# ricty font
# curl -L 'https://gist.github.com/ysaotome/7286145/raw/installing_ricty_on_MacOSX.sh' | bash

brew install node
npm install -g eslint


# s003 mac-in-office% brew list
# ansible                         glib                            libusb                          qt5
# arp-scan                        gmp                             libusb-compat                   readline
# arping                          gnutls                          libyaml                         reattach-to-user-namespace
# atk                             gobject-introspection           little-cms2                     rename
# autoconf                        graphite2                       macvim                          sane-backends
# automake                        gtk+                            make                            sc
# awscli                          harfbuzz                        makedepend                      shared-mime-info
# brew-file                       hicolor-icon-theme              nasm                            sqlite
# c-ares                          htop                            net-snmp                        sshpass
# cairo                           icu4c                           nettle                          tig
# cmake                           imagemagick                     nkf                             tmux
# cscope                          intltool                        nmap                            trash
# czmq                            jasper                          node                            tree
# d-bus                           jpeg                            node@6                          utf8proc
# dbus                            lame                            openjpeg                        vte
# diff-pdf                        libevent                        openssl                         webp
# doxygen                         libffi                          openssl@1.1                     wget
# ffmpeg                          libgcrypt                       p11-kit                         wine
# fontconfig                      libgpg-error                    pango                           wireshark
# fontforge                       libgphoto2                      pcre                            wxmac
# freetype                        libicns                         pixman                          x264
# fswatch                         libnet                          pkg-config                      xvid
# gd                              libpng                          poppler                         xz
# gdbm                            libsodium                       py2cairo                        zeromq
# gdk-pixbuf                      libtasn1                        pygobject                       zsh
# geoip                           libtiff                         pygtk
# gettext                         libtool                         python
# git                             libunistring                    qt
