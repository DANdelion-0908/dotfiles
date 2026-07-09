export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Sleep
alias slp="systemctl suspend"
