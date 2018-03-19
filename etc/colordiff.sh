#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    colordiff
echo
echo -------------------------------------------------

if ! type "colordiff" > /dev/null 2>&1; then
  if [ `get_os_name` == "mac" ]; then
    brew install colordiff
  elif [ `get_os_name` == "redhat" ]; then
    sudo yum -y install colordiff
  fi
fi
