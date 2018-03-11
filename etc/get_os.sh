#!/bin/bash -eu

# Get OS bit
# 32bit : i686
# 64bit : x86_64
get_os_bit() {
  OS_BIT=$(uname -m)
  echo ${OS_BIT};
}

# Get OS name
get_os_name() {
  if [ "$(uname)" == 'Darwin' ]; then
    OS_NAME="mac"
  elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if  [ -e /etc/debian_version ] ||
      [ -e /etc/debian_release ]; then
      # Check Ubuntu or Debian
      if [ -e /etc/lsb-release ]; then
        # Ubuntu
        OS_NAME="ubuntu"
      else
        # Debian
        OS_NAME="debian"
      fi
    elif [ -e /etc/fedora-release ]; then
      # Fedra
      OS_NAME="fedora"
    elif [ -e /etc/redhat-release ]; then
      if [ -e /etc/oracle-release ]; then
        # Oracle Linux
        OS_NAME="oracle"
      else
        # Red Hat Enterprise Linux
        OS_NAME="redhat"
      fi
    elif [ -e /etc/arch-release ]; then
      # Arch Linux
      OS_NAME="arch"
    elif [ -e /etc/turbolinux-release ]; then
      # Turbolinux
      OS_NAME="turbol"
    elif [ -e /etc/SuSE-release ]; then
      # SuSE Linux
      OS_NAME="suse"
    elif [ -e /etc/mandriva-release ]; then
      # Mandriva Linux
      OS_NAME="mandriva"
    elif [ -e /etc/vine-release ]; then
      # Vine Linux
      OS_NAME="vine"
    elif [ -e /etc/gentoo-release ]; then
      # Gentoo Linux
      OS_NAME="gentoo"
    else
      # Other
      echo "unkown distribution"
      OS_NAME="unkown"
    fi
  elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    OS_NAME='cygwin'
  else
    # Other
    echo "unkown os"
    OS_NAME="unkown"
  fi

  echo ${OS_NAME}
}

# Get distribution and bit
get_os_info() {
  echo $(get_os_distribution) $(get_os_bit)
}
