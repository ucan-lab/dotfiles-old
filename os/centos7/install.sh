#!/bin/bash -eu

cd `dirname $0`

echo -------------------------------------------------
echo
echo                    grc
echo
echo -------------------------------------------------

if ! type "grc" > /dev/null 2>&1
then
  sudo yum -y install python34-setuptools
  sudo easy_install-3.4 pip
  git clone https://github.com/garabik/grc.git /tmp/grc
  cd /tmp/grc
  sudo ./install.sh
  rm -rf /tmp/grc
  cd ~/dotfiles
fi

echo -------------------------------------------------
echo
echo                    colordiff
echo
echo -------------------------------------------------

if ! type "colordiff" > /dev/null 2>&1; then
  sudo yum -y install colordiff
fi

echo -------------------------------------------------
echo
echo                    source-highlight
echo
echo -------------------------------------------------

if ! type "source-highlight" > /dev/null 2>&1; then
  sudo yum -y install source-highlight
  sudo ln -sf /usr/bin/source-highlight /usr/local/bin/source-highlight
  sudo ln -sf /usr/bin/source-highlight-settings /usr/local/bin/source-highlight-settings
  sudo ln -sf /usr/bin/src-hilite-lesspipe.sh /usr/local/bin/src-hilite-lesspipe.sh
fi

echo -------------------------------------------------
echo
echo                    npm
echo
echo -------------------------------------------------

if type "npm" > /dev/null 2>&1; then
  if [ ! -e ~/.npm-global ]; then
    mkdir ~/.npm-global
  fi

  npm config set prefix '~/.npm-global'
  npm install npm --global
fi

echo -------------------------------------------------
echo
echo                    dotfiles
echo
echo -------------------------------------------------

. ~/dotfiles/os/common/dotfiles.sh

echo -------------------------------------------------
echo
echo                    zsh
echo
echo -------------------------------------------------

if ! type "zsh" > /dev/null 2>&1; then
  sudo yum -y install zsh
  sudo wget https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/CentOS_7/shells:zsh-users:zsh-completions.repo -P /etc/yum.repos.d
  sudo yum -y install zsh-completions
fi

if type "zsh" > /dev/null 2>&1; then
  `which zsh` ~/dotfiles/os/common/zsh_prezto.sh
fi

echo -------------------------------------------------
echo
echo                    vim
echo
echo -------------------------------------------------

if ! type "vim" > /dev/null 2>&1; then
  sudo yum -y install vim
fi

echo -------------------------------------------------
echo
echo                    Vundle
echo
echo -------------------------------------------------

rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
