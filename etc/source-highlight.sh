#!/bin/bash -eu

if ! type "source-highlight" > /dev/null 2>&1
then
  if [ `get_os_name` == "mac" ]; then
    brew install source-highlight
  elif [ `get_os_name` == "redhat" ]; then
    sudo yum -y install source-highlight
  fi
fi
