#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[[ -x "${f}" ]] && . "${f}"
	done
	unset f
fi

if [[ -f "${HOME}/.Xmodmap" ]]; then
	xmodmap "${HOME}/.Xmodmap"
fi

eval "$(gpg-agent --daemon --default-cache-ttl-ssh 86400\
	--default-cache-ttl 86400 --max-cache-ttl 86400 --max-cache-ttl-ssh 86400)"

xrdb ~/.Xresources

case "${1}" in
	xfce4)
		exec startxfce4
		;;
	*)
		xset r rate 300 25
		numlockx
		# mimic xfce environment in order to use exo-preferred-applications
		export DE=xfce
		export BROWSER=chromium
		export EDITOR=vim
		exec i3
		;;
esac


# exec gnome-session
# exec startkde
# ...or the Window Manager of your choice
# vim: syn=sh:
