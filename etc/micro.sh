#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    micro
echo
echo -------------------------------------------------

if ! type "micro" > /dev/null 2>&1; then
  if [ `get_os_name` == "mac" ]; then
    brew install micro
  elif [ `get_os_name` == "redhat" ]; then
    curl https://getmic.ro | bash
    sudo mv micro /usr/local/bin
    sudo chmod 755 /usr/local/bin/micro
  fi
fi
