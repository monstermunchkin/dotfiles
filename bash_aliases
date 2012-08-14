alias vi='vim'
alias sudo='sudo '
alias pip_upgrade_all='pip3 freeze | cut -d= -f1 | parallel sudo pip3 install --upgrade'
alias pip2_upgrade_all='pip2 freeze | cut -d= -f1 | parallel sudo pip2 install --upgrade'
