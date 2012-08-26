# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
PROMPT_COMMAND='history -a'

shopt -s histappend
shopt -s checkwinsize

# Set prompt string
if [[ -x /usr/bin/tput ]] && tput setaf 1 >/dev/null; then
	# We have color support!
	if [[ "${UID}" -eq 0 ]]; then
		# red username if root
		PS1='\[\033[1;31m\]\u\[\033[0m\]@\[\033[1;34m\]\h\[\033[0m\]\$ '
	else
		PS1='\[\033[1;32m\]\u\[\033[0m\]@\[\033[1;34m\]\h\[\033[0m\]\$ '
	fi
else
    PS1='\u@\h\$ '
fi

# Set terminal title
case "${TERM}" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]${PS1}";;
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

test -x /usr/bin/lesspipe.sh && eval "$(SHELL=/bin/bash lesspipe.sh)"
test -r /usr/share/bash-completion/bash_completion && \
	. /usr/share/bash-completion/bash_completion

fortune=

if [[ "${fortune}" == "yes" ]]; then
	fortune -a | fmt -80 -s | cowsay -$(shuf -n1 -e b d g p s t w y) \
		-f $(shuf -n1 -e $(cowsay -l | tail -n +2)) -n
	echo
fi

unset fortune
