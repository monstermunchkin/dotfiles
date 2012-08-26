# If not running interactively, don't do anything
[[ $- != *i* ]] && return

autoload -U colors && colors
autoload -U compinit && compinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

setopt NO_BEEP
setopt CORRECT

# Set prompt string
if [[ -x /usr/bin/tput ]] && tput setaf 1 >/dev/null; then
	if [[ "${UID}" -eq 0 ]]; then
		# red username if root
		PROMPT="%B%{$fg[red]%}%n%{$reset_color%}@%B%{$fg[blue]%}%m%{$reset_color%}%# "
	else
		PROMPT="%B%{$fg[green]%}%n%{$reset_color%}@%B%{$fg[blue]%}%m%{$reset_color%}%# "
	fi
else
	PROMPT="%n@%m%# "
fi

# Set terminal title
case "${TERM}" in
    xterm*|rxvt*)
		precmd () {print -Pn "e]0;%n@%m: %~a"}
esac

if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || \
        eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias sudo='sudo '

test -x /usr/bin/lesspipe.sh && eval "$(SHELL=/bin/zsh lesspipe.sh)"
