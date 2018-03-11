alias ..='cd ..'
alias mkdir='mkdir -p'

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
