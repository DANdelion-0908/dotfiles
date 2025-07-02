#!/bin/bash

########################################################################
### Installing necessary packages from official repositories and AUR ###
########################################################################

if [[ $UID -eq 0 ]]; then
    echo "This script should not be run as root."
    exit 1
fi

if ! command -v paru &> /dev/null; then
    echo "Paru is not installed. Please install it first."
    exit 1
fi

while IFS= read -r pkg; do
    if pacman -Sqi "$pkg" &>/dev/null; then
        echo "Installing $pkg from official repository..."
        sudo pacman -S --needed --noconfirm "$pkg"
    else
        echo "$pkg not found in official repos. Trying AUR..."
        paru -S --needed --noconfirm "$pkg"
    fi
done < packages.txt

echo ""
echo "Installation complete."

###############################
### Setting config files up ###
###############################

echo ""

if ! command -v stow &> /dev/null; then
    echo "Stow is not installed. Please install it first."
    exit 1
fi

echo "Creating Symbolic Links (Symlinks) and setting everything up..."

stow $(echo */)

echo ""
echo "Config files setted up."