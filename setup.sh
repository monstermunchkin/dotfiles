#!/bin/bash

sudo ln -fsv "${PWD}/vimrc" /etc/vimrc
sudo ln -fsv "${PWD}/wombat2562.vim" /usr/share/vim/vim73/colors/wombat2562.vim

ln -fsv "${PWD}/xinitc" ~/.xinitc
ln -fsv "${PWD}/Xresources" ~/.Xresources

ln -fsv "${PWD}/i3config" ~/.i3/config
ln -fsv "${PWD}/i3status.conf" ~/.i3status.conf

sudo ln -fsv "${PWD}/slim.conf" /etc/slim.conf

ln -fsv "${PWD}/zprofile" ~/.zprofile
