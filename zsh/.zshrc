# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U colors && colors

#setopt prompt_subst
#PS1='%F{203}[%F{109}%n% %F{131}@%F{158}%M% %F{192} %~% $(git_name)%F{203}]%F{229}$ '
#function git_name(){
#    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
#    if [[ $branch == "" ]];then
#        echo ""
#    else
#        echo '->('$branch')'
#    fi
#}


# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vith/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

export TERM="xterm-256color"

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


##
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
