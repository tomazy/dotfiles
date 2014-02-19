# Vi line edit mode
set -o vi

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

# Use brew's macvim
[[ -s /usr/local/bin/mvim ]] && alias vim='mvim -v'

# git completion options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
# load git completion
. $HOME/.git-completion.sh

# show branch name in the prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export EDITOR=vim

# load tmuxinator completion
source ~/.bin/tmuxinator.bash

[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh # This loads NVM
