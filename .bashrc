if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f ~/.prompt ]; then
  . ~/.prompt
fi

if [ -f ~/.alias ]; then
  . ~/.alias
fi

if [ -f ~/.function ]; then
  . ~/.function
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.fzf.bash ]; then
  . ~/.fzf.bash
fi

if [ -f ~/dotfiles/z/z.sh ]; then
  . ~/dotfiles/z/z.sh
fi

# History
HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# Language
export LANG=ja_JP.UTF-8

# "The default interactive shell is now zsh." message suppression.
export BASH_SILENCE_DEPRECATION_WARNING=1

# less
if [[ -x `which source-highlight` ]]; then
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

# Rust
if [ -e $HOME/.cargo/bin ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# Google Cloud
## The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then . '~/google-cloud-sdk/path.bash.inc'; fi
## The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then . '~/google-cloud-sdk/completion.bash.inc'; fi

# Hyper plugin - hyper-tab-icons-plus
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND} - ${PWD##*/}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac
