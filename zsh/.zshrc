#! /bin/zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd beep extendedglob nomatch notify

# Zsh Mode 
# -e = EMACS
# -v = Vi
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dandelion/.zshrc'

autoload -Uz compinit
compinit

# Zsh Bindkeys
bindkey '^[[H'  beginning-of-line  # Tecla Inicio (Home)
bindkey '^[[F'  end-of-line        # Tecla Fin (End)

# Zsh config
autoload -U compinit; compinit
setopt correct_all

# krabby
krabby random

# starship
eval "$(starship init zsh)"

# Grub Update
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# Clear Screen
alias cls='clear'

# Shut down
alias zzz='hyprshutdown -t "Shutting down..." --post-cmd "shutdown -P 0"'

# Reboot
alias rrr='hyprshutdown -t "Rebooting..." --post-cmd "reboot"'
