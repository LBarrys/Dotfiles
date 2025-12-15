#!/bin/sh

PREREQUISITES="alacritty hyprland hyprpaper hyprland-scratchpad hyprpolkitagent waybar cliphist nwg-look rofi-wayland pcmanfm lxmenu-data file-roller pavucontrol gammastep  fastfetch gruvbox-gtk-dark-medium-theme papirus-icon-theme papirus-folders breeze-cursor-theme msttcore-fonts-installer google-noto-emoji-fonts google-noto-color-emoji-fonts google-noto-sans-cjk-fonts google-noto-sans-symbols-fonts google-noto-sans-symbols-2-fonts google-rubik-fonts jetbrains-mono-fonts lm_sensors"

# Ensure needed packages are installed
if ! command -v $PREREQUISITES >/dev/null 2>&1; then
    echo -e "\033[31mNeeded packages are not installed.\033[0m"
    sudo dnf copr enable lbarrys/nwg-look -y
    sudo dnf copr enable lbarrys/papirus-folders -y
    sudo dnf copr enable lbarrys/gruvbox-gtk-dark-medium-theme -y
    sudo dnf copr enable lbarrys/cliphist -y
    sudo dnf copr enable lbarrys/hyprland -y
    sudo dnf copr enable lbarrys/hyprland-scratchpad -y
    sudo dnf copr enable lbarrys/msttcore-fonts-installer -y
    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    sudo dnf install $PREREQUISITES
    echo -e "\033[32mFinished installing needed packages.\033[0m"
fi

cp -r $HOME/Dotfiles/dotconfig/* $HOME/.config
cp -r $HOME/Dotfiles/dothome/* $HOME
mkdir -p $HOME/.local/bin
cp -r $HOME/Dotfiles/dotlocal/* $HOME/.local/bin
chmod 755 $HOME/.local/bin
