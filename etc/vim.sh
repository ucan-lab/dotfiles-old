#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    vim
echo
echo -------------------------------------------------

if ! type "vim" > /dev/null 2>&1
then
  if [ `get_os_name` == "mac" ]; then
    brew install vim
  elif [ `get_os_name` == "redhat" ]; then
    sudo yum -y install vim
  fi
fi

echo -------------------------------------------------
echo
echo                    Vundle
echo
echo -------------------------------------------------

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
