#!/bin/sh

PREREQUISITES="alacritty hyprland hyprpaper hyprland-scratchpad hyprpolkitagent waybar cliphist nwg-look rofi-wayland pcmanfm lxmenu-data file-roller pavucontrol gammastep lm_sensors fastfetch gruvbox-gtk-dark-medium-theme papirus-icon-theme papirus-folders breeze-cursor-theme ms-core-fonts google-noto-*"

# Ensure needed packages are installed
if ! command -v $PREREQUISITES >/dev/null 2>&1; then
    echo -e "\033[31mNeeded packages are not installed.\033[0m"
    sudo dnf copr enable lbarrys/nwg-look -y
    sudo dnf copr enable lbarrys/papirus-folders -y
    sudo dnf copr enable lbarrys/gruvbox-gtk-dark-medium-theme -y
    sudo dnf copr enable lbarrys/cliphist -y
    sudo dnf copr enable lbarrys/hyprland -y
    sudo dnf copr enable lbarrys/hyprland-scratchpad -y
    sudo dnf copr enable lbarrys/ms-core-fonts -y
    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    sudo dnf install $PREREQUISITES --exclude=google-noto-*-vf-*,google-noto-fonts-all,google-noto-fonts-all-static,google-noto-fonts-all-vf
    echo -e "\033[32mFinished installing needed packages.\033[0m"
fi

# Source bash file
echo 'source "$HOME/.config/bash"' | sudo tee -a $HOME/.bashrc

# Set Qt theme
sudo mkdir -p /etc/environment.d/
sudo touch /etc/environment.d/qt6.conf
echo "QT_QPA_PLATFORMTHEME=fusion" | sudo tee -a /etc/environment.d/qt6.conf

# Better looking fonts
echo 'FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"' | sudo tee -a /etc/environment
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/

# Copy Dotfiles to their correct places
cp -r $HOME/Dotfiles/dotconfig/* $HOME/.config
cp -r $HOME/Dotfiles/dothome/* ~/
mkdir -p $HOME/.local/bin
cp -r $HOME/Dotfiles/dotlocal/* $HOME/.local/bin
chmod 755 $HOME/.local/bin
