#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    zsh-completions
echo
echo -------------------------------------------------

if [ `get_os_name` == "mac" ]; then
  if [ ! -e /usr/local/share/zsh-completions ]; then
    brew install zsh-completions
  elif [ `get_os_name` == "redhat" ]; then
    sudo wget https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/CentOS_7/shells:zsh-users:zsh-completions.repo -P /etc/yum.repos.d
    sudo yum -y install zsh-completions
  fi
fi
