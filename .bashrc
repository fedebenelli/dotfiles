#
# ~/.bashrc
#

# Edito PATH
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Default PS1:
# PS1='[\u@\h \W]\$ '

PS1='\[\e[1;33m\][\[\e[m\]\[\e[0;32m\]\u\[\e[m\]@\[\e[0;31m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;33m\]]\[\e[m\]\[\e[5;32m\]\$\[\e[m\]\[\e[1;37m\] '
alias config='/usr/bin/git --git-dir=/home/ruther/.dotfiles/ --work-tree=/home/ruther'
