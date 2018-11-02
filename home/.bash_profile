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

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  export __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh # This loads NVM
