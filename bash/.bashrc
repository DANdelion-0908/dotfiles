#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# krabby
krabby random

# starship
eval "$(starship init bash)"

# Grub Update
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# Clear Screen
alias cls='clear'
