#!/bin/bash -eu

# submodule
git submodule update --init --recursive

# os info
. os/common/get_os.sh

if [ `get_os_name` == "mac" ]; then
  . os/mac/install.sh
elif [ `get_os_name` == "redhat" ]; then
  . os/centos7/install.sh
fi

. os/common/success.sh
