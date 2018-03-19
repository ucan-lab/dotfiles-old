#
# Executes commands at the start of an interactive session.
#

# Show ssh username and hostname
SSH_CONNECTION=1

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  . "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# theme
prompt pure

# less
if type "source-highlight" > /dev/null 2>&1; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

# nodebrew
if type "nodebrew" > /dev/null 2>&1; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# zsh-completions
if [ -e /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# knu/z
. ~/dotfiles/z/z.sh

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

# colordiff
if type "colordiff" > /dev/null 2>&1; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# micro
if type "micro" > /dev/null 2>&1; then
  alias mi='micro'
fi

# ccat
if type "ccat" > /dev/null 2>&1; then
  alias cat='ccat'
fi

# Laravel
alias art='php artisan'
alias serve='php artisan serve --host 0.0.0.0'
alias fresh='php artisan migrate:fresh --seed'
alias migrate='php artisan migrate'
alias seed='php artisan db:seed'
alias tinker='php artisan tinker'
alias test='vendor/bin/phpunit --colors=always'
