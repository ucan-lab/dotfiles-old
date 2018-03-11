#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    source-highlight
echo
echo -------------------------------------------------

if ! type "source-highlight" > /dev/null 2>&1
then
  if [ `get_os_name` == "mac" ]; then
    brew install source-highlight
  elif [ `get_os_name` == "redhat" ]; then
    sudo yum -y install source-highlight
    sudo ln -sf /usr/bin/source-highlight /usr/local/bin/source-highlight
    sudo ln -sf /usr/bin/source-highlight-settings /usr/local/bin/source-highlight-settings
    sudo ln -sf /usr/bin/src-hilite-lesspipe.sh /usr/local/bin/src-hilite-lesspipe.sh
  fi
fi
