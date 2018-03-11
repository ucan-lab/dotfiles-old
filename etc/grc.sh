#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    grc
echo
echo -------------------------------------------------

if ! type "grc" > /dev/null 2>&1
then
  if [ `get_os_name` == "mac" ]; then
    brew install grc
  elif [ `get_os_name` == "redhat" ]; then
    sudo yum -y install python34-setuptools
    sudo easy_install-3.4 pip
    git clone https://github.com/garabik/grc.git /tmp/grc
    cd /tmp/grc
    sudo ./install.sh
    rm -rf /tmp/grc
    cd ~/dotfiles
  fi
fi
