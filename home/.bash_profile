# Vi line edit mode
set -o vi

# Aliases
alias ll='ls -lha'

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# git completion options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
# load git completion
. $HOME/.git-completion.sh

# show branch name in the prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
