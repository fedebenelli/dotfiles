#!/bin/sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Functions
#------------------
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/functions"
# source /usr/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper_lazy.sh

# Vi mode
#------------------
set -o vi

# Custom variables
#------------------
csgocfg='~/.steam/steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg/autoexec.cfg'
jupyterfolder='/media/bigdata/OneDrive/Documentos/Programming/Python/jupyter'

# My aliases
#------------------
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcuts"
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# My name
#------------------
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/PS1"

source ~/docs/research/thermo/algos/envelopes/other/paper/fcmmp/input_files/runner.sh

# Stuff to show when starting bash
#------------------
i=0
t=$(date)
echo "-> Calendar: $t"
printf '\n--------------------------------'
while [ "$i" -le "${#t}" ]; do printf "-"; i=$((i+1)); done
echo
cal -3
echo
## echo "-> Appointments"
# Show
## calcurse -a
## [ $(cat ~/.cache/caldavstatus)="notworks" ] &&
##     printf "\n$(red 'WARNING: update caldav!')\n"
## hline
## echo "-> To-do"
## td show
## echo ""

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then
	source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash";
fi
# END_KITTY_SHELL_INTEGRATION
