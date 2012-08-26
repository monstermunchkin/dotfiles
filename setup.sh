#!/bin/bash

sudo ln -fsv "${PWD}/profile" /etc/profile
sudo ln -fsv "${PWD}/bash.bashrc" /etc/bash.bashrc

sudo ln -fsv "${PWD}/vimrc" /etc/vimrc
sudo ln -fsv "${PWD}/wombat2562.vim" /usr/share/vim/vim73/colors/wombat256.vim

ln -fsv "${PWD}/xinitc" ~/.xinitc
ln -fsv "${PWD}/Xresources" ~/.Xresources

ln -fsv "${PWD}/i3config" ~/.i3/config
ln -fsv "${PWD}/i3status.conf" ~/.i3status.conf

ln -fsv "${PWD}/zshrc" ~/.zshrc
