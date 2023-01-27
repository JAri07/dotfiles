#!/bin/sh

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd ~
sudo pacman -Syu sddm bat exa mdcat brightnessctl nemo fzf pacman-contrib man-db
paru -S rofi-lbonn-wayland-git sddm-sugar-dark hyprpaper-git grim slurp sioyek hyprland-nvidia
