if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# less
if [[ -x `which source-highlight` ]]; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

export PATH=~/.npm-global/bin:$PATH

if type "nodebrew" > /dev/null 2>&1; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

##
# alias
#

alias ..='cd ..'
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

# Laravel
alias art='php artisan'
alias serve='php artisan serve --host 0.0.0.0'
alias fresh='php artisan migrate:fresh --seed'
alias migrate='php artisan migrate'
alias seed='php artisan db:seed'
alias tinker='php artisan tinker'
alias test='vendor/bin/phpunit --colors=always'
