#!/bin/bash -eu

cd `dirname $0`

echo -------------------------------------------------
echo
echo                    homebrew
echo
echo -------------------------------------------------

if ! type "brew" > /dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -------------------------------------------------
echo
echo                    homebrew update and upgrade
echo
echo -------------------------------------------------

brew update
brew upgrade

echo -------------------------------------------------
echo
echo                    grc
echo
echo -------------------------------------------------

if ! type "grc" > /dev/null 2>&1; then
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
echo                    bash-completion
echo
echo -------------------------------------------------

brew install bash-completion

echo -------------------------------------------------
echo
echo                    nodenv
echo
echo -------------------------------------------------

if ! type "nodenv" > /dev/null 2>&1; then
  brew install nodenv
  eval "$(nodenv init -)"
fi

echo -------------------------------------------------
echo
echo                    tmux
echo
echo -------------------------------------------------

if ! type "tmux" > /dev/null 2>&1; then
  brew install tmux reattach-to-user-namespace
fi

echo -------------------------------------------------
echo
echo                    fzf
echo
echo -------------------------------------------------

if ! type "fzf" > /dev/null 2>&1; then
  brew install fzf
  $(brew --prefix)/opt/fzf/install
fi

echo -------------------------------------------------
echo
echo                    nodenv
echo
echo -------------------------------------------------

if ! type "nodenv" > /dev/null 2>&1; then
  brew install nodenv
fi

echo -------------------------------------------------
echo
echo                    dotfiles
echo
echo -------------------------------------------------

. ~/dotfiles/os/common/dotfiles.sh

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
