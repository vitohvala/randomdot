#!/bin/zsh
autoload -U colors && colors

function git_name(){
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]];then
        echo ""
    else
        echo '->('$branch')'
    fi
}

setopt prompt_subst

PS1='%F{203}[%F{109}%n% %F{131}@%F{158}%M% %F{192} %~% $(git_name)%F{203}]%F{229}$ '



HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

export TERM="xterm-256color"

#aliases
alias cdz="cd ~/.config/zsh/"
alias cdwm="cd ~/.config/dwm"
alias cst="cd ~/.config/st"
alias csl="cd ~/.config/slstatus/"
alias ls="ls --color"
alias nv="nvim"
alias ncf="nvim config.h"
alias cleanup="sudo pacman -Rsn $(pacman -Qdtq)"
alias cleankes="sudo pacman -Sc"
alias skloni="rm -rf"
alias :q="exit"
alias wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"
alias xampp='sudo /opt/lampp/manager-linux-x64.run'


autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
