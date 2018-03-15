#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    zsh
echo
echo -------------------------------------------------

if ! type "zsh" > /dev/null 2>&1; then
  if [ `get_os_name` == "mac" ]; then
    brew install zsh
  elif [ `get_os_name` == "redhat" ]; then
    sudo yum -y install zsh
  fi
fi

touch ~/.zshrc
