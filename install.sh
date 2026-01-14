#!/bin/sh

PREREQUISITES="alacritty hyprland hyprpaper hyprland-scratchpad soteria waybar cliphist nwg-look rofi-wayland nautilus file-roller-nautilus pavucontrol gammastep lm_sensors fastfetch gruvbox-gtk-dark-medium-theme papirus-icon-theme papirus-folders breeze-cursor-theme"

# Ensure needed packages are installed
if ! command -v $PREREQUISITES >/dev/null 2>&1; then
    sudo dnf copr enable lbarrys/LBsWorld -y
    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
    sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    sudo dnf install $PREREQUISITES
    sudo dnf install ms-core-*-fonts google-noto-* --exclude=google-noto-*-vf-*,google-noto-fonts-all,google-noto-fonts-all-static,google-noto-fonts-all-vf
fi

# Source bash file
echo 'source "$HOME/.config/bash"' >> $HOME/.bashrc

# Set Qt theme
sudo mkdir -p /etc/environment.d/
sudo touch /etc/environment.d/qt6.conf
echo "QT_QPA_PLATFORMTHEME=fusion" | sudo tee -a /etc/environment.d/qt6.conf

# Better looking fonts
echo 'FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"' | sudo tee -a /etc/environment
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/

# Copy Dotfiles to their correct places
mkdir -p $HOME/.local/bin
cp -r $HOME/Dotfiles/dotlocal/* $HOME/.local/bin
cp -r $HOME/Dotfiles/dotconfig/* $HOME/.config
chmod 755 $HOME/.local/bin
