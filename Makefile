.PHONY: all clean bash colordiff i3 vim xorg zsh

all: bash colordiff i3 vim xorg zsh

clean:
	rm -rf \
		~/.colordiff \
		~/.i3/config  \
		~/.i3status \
		~/.xinitrc \
		~/.Xresources \
		~/.zprofile
	sudo rm -rf \
		/etc/bash.bashrc \
		/etc/profile \
		/usr/local/bin/i3swrapper \
		/etc/vimrc \
		/usr/local/share/vim/bundle/vundle \
		/etc/zsh/zshrc \
		/etc/zsh/zprofile \
		/usr/local/share/oh-my-zsh

bash: bash/bashrc bash/profile
	sudo ln -sfv $(PWD)/bash/bashrc /etc/bash.bashrc
	sudo ln -sfv $(PWD)/bash/profile /etc/profile

colordiff: colordiff/colordiffrc
	ln -sfv $(PWD)/colordiff/colordiffrc ~/.colordiffrc

i3: i3/config i3/i3status.conf i3/i3swrapper
	install -d ~/.i3
	ln -sfv $(PWD)/i3/config ~/.i3/config
	ln -sfv $(PWD)/i3/i3status.conf ~/.i3status.conf
	sudo ln -sfv $(PWD)/i3/i3swrapper /usr/local/bin/i3swrapper

vim: vim/vimrc vim/Vundle.vim
	sudo ln -sfv $(PWD)/vim/vimrc /etc/vimrc
	sudo install -d /usr/local/share/vim/bundle
	sudo rm -rfv /usr/local/share/vim/bundle/vundle
	sudo ln -sfv $(PWD)/vim/Vundle.vim /usr/local/share/vim/bundle/vundle

xorg: xorg/xinitrc xorg/Xresources
	ln -sfv $(PWD)/xorg/xinitrc ~/.xinitrc
	ln -sfv $(PWD)/xorg/Xresources ~/.Xresources

zsh: zsh/zshrc zsh/zprofile.global zsh/zprofile.local zsh/oh-my-zsh \
	zsh/zsh-custom
	sudo install -d /etc/zsh
	sudo ln -sfv $(PWD)/zsh/zshrc /etc/zsh/zshrc
	sudo ln -sfv $(PWD)/zsh/zprofile.global /etc/zsh/zprofile
	ln -sfv $(PWD)/zsh/zprofile.local ~/.zprofile
	sudo rm -rfv /usr/local/share/oh-my-zsh
	sudo ln -sfv $(PWD)/zsh/oh-my-zsh /usr/local/share/oh-my-zsh
	rm -rfv zsh/oh-my-zsh/custom
	ln -sfv $(PWD)/zsh/zsh-custom zsh/oh-my-zsh/custom
