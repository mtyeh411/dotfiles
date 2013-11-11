
if [ -f "$HOME/.bash_profile" ]; then
  source $HOME/.bash_profile
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# [ -n "$PS1" ] && source ~/.bash_profile

