# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh
autoload -U colors && colors 
#PS1="%B%{$fg[214]%}[%{$fg[blue]%}%n%{$fg[red]%}@%{$fg[blue]%}%M %{$fg[109]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


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



autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh>/dev/null
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
