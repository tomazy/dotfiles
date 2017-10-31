if [ -f ~/.bashrc ]; then
  source ~/.bashrc;
fi

# Aliases
if [ "$(uname)" == "Darwin" ]; then
  alias ls='ls -FG'
else
  alias ls='LC_COLLATE=C ls -F --color=auto'
fi
alias ll='ls -lha'
alias tmux='tmux -2'

export EDITOR=vim

# git completion options
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUPSTREAM="auto"
# load git completion
source ~/.git-completion.sh

# load tmuxinator completion
source ~/.bin/tmuxinator.bash

[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh # This loads NVM
