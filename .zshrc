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

# theme
prompt pure

# read grc setting
[[ -s "/usr/local/etc/grc.zsh" ]] && . /usr/local/etc/grc.zsh

# less
if type "source-highlight" > /dev/null 2>&1; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

# nodebrew
if type "nodebrew" > /dev/null 2>&1; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

##
# alias
#

alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [[ $(uname) == 'Darwin' ]]; then
  alias ll='ls  -lhGT'
  alias la='ls -alhGT'
else
  alias ll='ls  -lh --time-style=long-iso --color=auto'
  alias la='ls -alh --time-style=long-iso --color=auto'
fi

# Laravel
alias art='php artisan'
alias serve='php artisan serve --host 0.0.0.0'
alias fresh='php artisan migrate:fresh --seed'
alias migrate='php artisan migrate'
alias seed='php artisan db:seed'
alias tinker='php artisan tinker'
alias test='vendor/bin/phpunit --colors=always'
