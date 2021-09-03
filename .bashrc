#----------------------------------------------
#  /\//  __   __               __              |
# //\/ _/_/  / /_  ____ ______/ /_  __________ |
#    _/_/   / __ \/ __ `/ ___/ __ \/ ___/ ___/ |
#  _/_/  _ / /_/ / /_/ (__  ) / / / /  / /__   |
# /_/   (_)_.___/\__,_/____/_/ /_/_/   \___/   |
#----------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


yellow() {
	echo "\[\e[1;33m\]$1\[\e[m\]"
}

green() {
	echo "\[\e[1;32m\]$1\[\e[m\]"
}

red() {
	echo "\[\e[1;31m\]$1\[\e[m\]"
}

blue() {
	echo "\[\e[1;34m\]$1\[\e[m\]"
}

blinking-green() {
	echo "\e[5;32m\]$1\[\e[m\]"
}

yta() {
    mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
}

get_paper() {
	doi="$1"
	sci_hub="sci-hub.se"
	pdf_link="$(curl https://$sci_hub/$doi | grep -o "$sci_hub.*pdf" | head -n1)"
	pdf_name="$(curl https://$sci_hub/$doi | grep title | cut -d'|' -f2)"
	pdf_name="${pdf_name# *}"
	pdf_name="${pdf_name%* }"
	wget "$pdf_link" -O "${PAPERS_DIR:-${XDG_DOWNLOAD_DIR:-$HOME/Downloads}}/$pdf_name.pdf"
}


nap() {
	mkdir "$1"
	cp $HOME/docs/programming/arduino/Makefile "$1/"
	cd $1
	cp "${XDG_TEMPLATES_DIR:-$HOME/Templates}/arduino/default.ino" "$1.ino"
	$EDITOR $1.ino
}

hline() {
	printf "\n <"
	#bat=$(battery)
	#printf "%s" "$bat"
	dat=$(date +%d/%m-%H:%M:%S)
	len=$(($(tput cols) - ${#bat} - ${#dat} - 4))
	for i in $(seq 1 $len); do
		printf "-"
	done
	printf "[$dat]\n\n"
}

pdftitle() {
	title="$(pdfinfo "$1" | grep Title | cut -d':' -f2)"
	# double echo to delete whitespace at the start,
	#  guess could just do another strint cut.
	echo "$(echo ${title% .*})"
}

wttr() {
	curl wttr.in/cordoba,ar
}

# Vi mode
#------------------
set -o vi

# Custom variables
csgocfg='$HOME/docs/games/roterautoexec.cfg'
jupyterfolder='/media/bigdata/OneDrive/Documentos/Programming/Python/jupyter'

# My aliases
#------------------
source $HOME/.config/shell/shortcuts
alias \
	"qemu"='qemu-system-x86_64 -m 2048 -monitor stdio "$1"' \
	"showcolors"='for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""' \
	"proton"='PROTON_NO_ESYNC=1 $HOME/.steam/root/compatibilitytools.d/Proton-5.21-GE-1/dist/bin/wine64' \
	"dotfiles"="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME" \
	"jl"='cd "$jupyterfolder"; jupyter lab --ip 192.168.100.2 --port 8888' \
	"conlucrecita"='ssh ruther@lucrecita -t "tmux attach || tmux new"' \
	"ward"="stty -F /dev/ttyACM* speed 9600; tail -f /dev/ttyACM*" \
	"cdsteam"='cd $HOME/.local/share/Steam/steamapps/common/' \
	"myweb"='cd $HOME/docs/learning/markup/web/mywebsite' \
	"nvi"='$EDITOR ${XDG_CONFIG_HOME}/nvim/init.vim' \
	"ranco"='$EDITOR $HOME/.config/ranger/rc.conf' \
	"isomount"='sudo mount -o loop $1 /media/iso/' \
	"picomex"='picom --experimental-backends -b' \
	"i3bc"='$EDITOR ~/.config/i3blocks/config' \
	"mysc"="$EDITOR $HOME/.local/scripts" \
	"i3c"='$EDITOR ~/.config/i3/config' \
	"sizes"='du . -h --max-depth=1' \
	"downurl"='wget -mkEpnp '$1 \
	"ll"="ls --color=auto -lAh" \
	"csgocfg"='$EDITOR "$csgocfg"' \
	"yeet"='sudo yay -Rcsn' \
	"ls"='ls --color=auto' \
	"sysup"='yay -Syu' \
	"df"='df -h' \

# My name
#------------------
PS1="•$(yellow '[')$(blue '\u')@$(red '\h') $(green '\w')$(yellow ']') \n$(blinking-green '└-------------$(($(ls -la ~ | wc -l)-3))---->') "


# Stuff to show when starting bash
i=0
t=$(date)
echo "-> Calendar: $t"
printf '\n--------------------------------'
while [ "$i" -le "${#t}" ]; do printf "-"; i=$((i+1)); done
echo
cal -3
echo
echo "-> Appointments"
# Show
calcurse -a
hline
echo "-> To-do"
td show
echo ""

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
