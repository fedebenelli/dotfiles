#!/bin/sh

#echo "Start X server?"
#read manager
#
#[ -x $manager ] && exit 0

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# merge in defaults and keymaps
[ -f $sysresources ] &&  xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11

pgrep sxhkd || sxhkd -c ~/.config/sxhkd/sxhkdrc &
pgrep mpd || mpd &
#mpv ~/.config/startup.m4a --loop=no --loop-file=no --loop-playlist=no &

# Set wallpaper and default colors
picom &
xwallpaper --zoom $HOME/.config/wallpaper.png &
update-colors
wait &

# Keyboard layout
setxkbmap latam &

# systray applets
nm-applet &
blueman-applet &
pasystray &

# Sound stuff
# easyeffects &
# set_sink set &

# Sync files
syncthingtray --wait &

# Start wm

sudo cpupower frequency-set --governor powersave
exec awesome
