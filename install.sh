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

#######################################################
### Cloning and installing config files from GitHub ###
#######################################################

echo ""
echo "Cloning and installing config files from GitHub..."

git clone https://github.com/DANdelion-0908/hypr.git ~/.config/hypr
git clone https://github.com/DANdelion-0908/waybar.git ~/.config/waybar
git clone https://github.com/DANdelion-0908/kitty.git ~/.config/kitty
git clone https://github.com/DANdelion-0908/fastfetch.git ~/.config/fastfetch
git clone https://github.com/DANdelion-0908/rofi.git ~/.config/rofi
git clone git@github.com:DANdelion-0908/XD.git ~/Pictures/XD
git clone git@github.com:DANdelion-0908/Scores.git ~/Documents/MuseScore4/Scores

echo ""
echo "Config files cloned and installed."