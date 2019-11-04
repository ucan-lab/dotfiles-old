#
# Executes commands at the start of an interactive session.
#

# zsh option
setopt RM_STAR_SILENT

# History
HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# Language
export LANG=ja_JP.UTF-8

# Show ssh username and hostname
SSH_CONNECTION=1

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  . "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -f ~/.alias ]; then
  . ~/.alias
fi

if [ -f ~/.function ]; then
  . ~/.function
fi

# if [ -f ~/.fzf.zsh ]; then
#   . ~/.fzf.zsh
# fi

# if [ -f ~/dotfiles/z/z.sh ]; then
#   . ~/dotfiles/z/z.sh
# fi

# less
if type "source-highlight" > /dev/null 2>&1; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

# nodenv
if type "nodenv" > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# composer
if [ -e $HOME/.composer/vendor/bin ]; then
  export PATH=$HOME/.composer/vendor/bin:$PATH
fi

# google cloud sdk
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

if [ -e $HOME/google-cloud-sdk/bin ]; then
  export PATH=$HOME/google-cloud-sdk/bin:$PATH
fi

if [ -e /Applications/MAMP/bin/php/php7.3.1/bin ]; then
  export PATH=/Applications/MAMP/bin/php/php7.3.1/bin:$PATH
fi

if [ -e /Applications/MAMP/Library/bin ]; then
  export PATH=/Applications/MAMP/Library/bin:$PATH
fi

# rust
if [ -e /Applications/MAMP/Library/bin ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

## Hyper plugin - hyper-tab-icons-plus

# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
tabtitle_precmd() {
   if overridden; then return; fi
   pwd=$(pwd) # Store full path as variable
   cwd=${pwd##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
}
[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions tabtitle_precmd)

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
tabtitle_preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
}
[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions tabtitle_preexec)

## Hyper plugin - hyper-tab-icons-plus
