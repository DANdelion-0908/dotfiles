# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dandelion/.zshrc'

autoload -Uz compinit
compinit

# krabby
krabby random

# starship
eval "$(starship init zsh)"

# Grub Update
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# Clear Screen
alias cls='clear'
