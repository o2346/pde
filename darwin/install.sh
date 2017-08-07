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

