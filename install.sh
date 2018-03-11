#!/bin/bash -eu

source etc/get_os.sh
source etc/brew.sh
source etc/source-highlight.sh
source etc/zsh.sh
if type "zsh" > /dev/null 2>&1
then
  source etc/zsh_prezto.sh
fi

echo -------------------------------------------------
echo
echo                    prezto
echo
echo -------------------------------------------------

if ! type "zsh" > /dev/null 2>&1
then
  brew install zsh
fi

source prezto.sh

echo -------------------------------------------------
echo
echo                    npm
echo
echo -------------------------------------------------

if type "npm" > /dev/null 2>&1
then
  if [ ! -e ~/.npm-global ]; then
    mkdir ~/.npm-global
  fi

  npm config set prefix '~/.npm-global'
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
echo                    dotfiles
echo
echo -------------------------------------------------

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  ln -sf ~/dotfiles/$f ~/$f
done

echo -------------------------------------------------
echo
echo                    Vundle
echo
echo -------------------------------------------------

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
