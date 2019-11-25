#
# ~/.bashrc
#

# Edito PATH
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/ruther/.dotfiles/ --work-tree=/home/ruther'
