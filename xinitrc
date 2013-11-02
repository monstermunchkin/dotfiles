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

systemctl --user isolate graphical.target

# mimic gnome environment in order to use exo-preferred-applications
# gnome env will also recognize magnet link handlers for chromium
export DE=gnome
export BROWSER=chromium
export EDITOR=vim

exec "${1}"

# exec gnome-session
# exec startkde
# ...or the Window Manager of your choice
# vim: syn=sh:
