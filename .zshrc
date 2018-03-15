#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Show ssh username and hostname
SSH_CONNECTION=1

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

####################
#     Colorize     #
####################

# theme
prompt pure

# read grc setting
[[ -s "/usr/local/etc/grc.zsh" ]] && source /usr/local/etc/grc.zsh

# less
if type "source-highlight" > /dev/null 2>&1; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

# grep
export GREP_OPTIONS='--color=auto'

# nodebrew
if type "nodebrew" > /dev/null 2>&1; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
