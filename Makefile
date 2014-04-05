.PHONY: \
	all clean global local \
	bash bash-local bash-global \
	colordiff colordiff-local \
	i3 i3-local i3-global \
	vim vim-local vim-global \
	xorg xorg-local \
	zsh zsh-local zsh-global

all: bash colordiff i3 vim xorg zsh

global: bash-global i3-global vim-global zsh-global

local: bash-local colordiff-local i3-local vim-local xorg-local zsh-local

clean: clean-global clean-local

clean-local:
	rm -rf \
		~/.colordiff \
		~/.i3/config  \
		~/.i3status \
		~/.xinitrc \
		~/.Xresources \
		~/.zprofile \
		/usr/local/share/vim/bundle

clean-global:
	sudo rm -rf \
		/etc/bash.bashrc \
		/etc/profile \
		/usr/local/bin/i3swrapper \
		/etc/vimrc \
		/etc/zsh/zshrc \
		/etc/zsh/zprofile \
		/usr/local/share/oh-my-zsh

bash: bash-global

bash-global: bash/bashrc bash/profile
	sudo ln -sfv $(PWD)/bash/bashrc /etc/bash.bashrc
	sudo ln -sfv $(PWD)/bash/profile /etc/profile

colordiff: colordiff-local

colordiff-local: colordiff/colordiffrc
	ln -sfv $(PWD)/colordiff/colordiffrc ~/.colordiffrc

i3: i3-global i3-local

i3-local: i3/config i3/i3status.conf
	install -d ~/.i3
	ln -sfv $(PWD)/i3/config ~/.i3/config
	ln -sfv $(PWD)/i3/i3status.conf ~/.i3status.conf

i3-global: i3/i3swrapper
	sudo ln -sfv $(PWD)/i3/i3swrapper /usr/local/bin/i3swrapper

vim: vim-global vim-local

vim-local: vim/Vundle.vim
	rm -rfv /usr/local/share/vim/bundle/vundle
	ln -sfv $(PWD)/vim/Vundle.vim /usr/local/share/vim/bundle/vundle

vim-global: vim/vimrc
	sudo ln -sfv $(PWD)/vim/vimrc /etc/vimrc
	sudo install -dm777 /usr/local/share/vim/bundle

xorg: xorg-local

xorg-local: xorg/xinitrc xorg/Xresources
	ln -sfv $(PWD)/xorg/xinitrc ~/.xinitrc
	ln -sfv $(PWD)/xorg/Xresources ~/.Xresources

zsh: zsh-global zsh-local

zsh-local: zsh/zprofile.local zsh/zsh-custom
	rm -rfv ~/.oh-my-zsh
	ln -sfv /usr/local/share/oh-my-zsh ~/.oh-my-zsh
	ln -sfv $(PWD)/zsh/zprofile.local ~/.zprofile
	rm -rfv zsh/oh-my-zsh/custom
	ln -sfv $(PWD)/zsh/zsh-custom zsh/oh-my-zsh/custom

zsh-global: zsh/zshrc zsh/zprofile.global zsh/oh-my-zsh
	sudo install -d /etc/zsh
	sudo ln -sfv $(PWD)/zsh/zshrc /etc/zsh/zshrc
	sudo ln -sfv $(PWD)/zsh/zprofile.global /etc/zsh/zprofile
	sudo rm -rfv /usr/local/share/oh-my-zsh
	sudo ln -sfv $(PWD)/zsh/oh-my-zsh /usr/local/share/oh-my-zsh
