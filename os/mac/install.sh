#!/bin/bash -eu

cd `dirname $0`

echo -------------------------------------------------
echo
echo                    homebrew
echo
echo -------------------------------------------------

if ! type "brew" > /dev/null 2>&1; then
  echo "homebrew install"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -------------------------------------------------
echo
echo                    grc
echo
echo -------------------------------------------------

if ! type "grc" > /dev/null 2>&1
then
  brew install grc
fi

echo -------------------------------------------------
echo
echo                    colordiff
echo
echo -------------------------------------------------

if ! type "colordiff" > /dev/null 2>&1; then
  brew install colordiff
fi

echo -------------------------------------------------
echo
echo                    source-highlight
echo
echo -------------------------------------------------

if ! type "source-highlight" > /dev/null 2>&1; then
  brew install source-highlight
fi

echo -------------------------------------------------
echo
echo                    npm
echo
echo -------------------------------------------------

if type "npm" > /dev/null 2>&1; then
  if [ ! -e ~/.npm ]; then
    mkdir ~/.npm
  fi

  npm config set prefix '~/.npm'
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
  brew install zsh
fi

echo -------------------------------------------------
echo
echo                    vim
echo
echo -------------------------------------------------

if ! type "vim" > /dev/null 2>&1; then
  brew install vim
fi

echo -------------------------------------------------
echo
echo                    Vundle
echo
echo -------------------------------------------------

rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
