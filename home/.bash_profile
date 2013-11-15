# Vi line edit mode
set -o vi

# Aliases
if [ "$(uname)" == "Darwin" ]; then
  alias ls='ls -FG'
else
  alias ls='LC_COLLATE=C ls -F --color=auto'
fi
alias ll='ls -lha'
alias tmux='tmux -2'

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"

# This loads NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# see brew
export PATH=/usr/local/bin:$PATH

# Use brew's macvim
[[ -s /usr/local/bin/mvim ]] && alias vim='mvim -v'

# git completion options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
# load git completion
. $HOME/.git-completion.sh

# show branch name in the prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
