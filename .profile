#
# ~/.profile
#

# Start with XDG paths
export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_CACHE_HOME="$HOME/.cache/"
export XDG_DATA_HOME="$HOME/.local/share/"
# XDG PATHS acording to user.dirs
export XDG_HOME_DIR="$HOME/"
export XDG_CONFIG_DIR="$HOME/.config/"
export XDG_DESKTOP_DIR="$HOME/"
export XDG_DOCUMENTS_DIR="$HOME/docs/"
export XDG_DOWNLOAD_DIR="$HOME/downs/"
export XDG_MUSIC_DIR="$HOME/music/"
export XDG_PICTURES_DIR="$HOME/pics/"
export XDG_TEMPLATES_DIR="$HOME/docs/templates/"
export XDG_PUBLICSHARE_DIR="$HOME/docs/public/"
export XDG_VIDEOS_DIR="$HOME/vids/"
export XDG_TRASH_DIR="$HOME/.local/share/Trash/"
export BIBFILE="$HOME/docs/research/bibliography.bib"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.local/scripts:$HOME/.local/bin:$HOME/.emacs.d/bin:$HOME/docs/research/thermo/software/gams39.1_linux_x64_64_sfx"
export ZDOTDIR="$HOME/.config/shell/zsh"

# Default software to use
export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export SUDO=sudo

# Custom folders to some programs
export WINEPREFIX="$HOME/installs/winepfx"
export PAPERS_DIR="$HOME/docs/research/papers/"
export WORKON_HOME="${XDG_HOME_DIR}/docs/programming/python/virtualenvs"

# Cleaning a bit home directory
export LESSHISTFILE=-
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XRESOURCES="$XDG_CONFIG_HOME"/X11/Xresources
export SHORTCUTS="$XDG_CONFIG_HOME"/shortcuts
export PYTHONHISTFILE="$XDG_CONFIG_HOME"/python/python_history
export BASH_HISTORY="$XDG_CONFIG_HOME/shell/bash/history"

# Other settings
export FMOD_ALSA_DEVICE=pipewire 
export QT_QPA_PLATFORMTHEME="qt5ct"

#source "${XDG_CONFIG_HOME/mendeley-cli-settings}"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]

[ -f ~/.bashrc ] && . ~/.bashrc

[ $(tty) = "/dev/tty1" ] && exec startx
