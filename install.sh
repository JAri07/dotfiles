#!/bin/bash
# Installation process
sudo pacman -Syu --needed base-devel git

source .install/paru.sh
source .install/packages.sh
source .install/neovim.sh

# Move config files

if [ -d ~/.config/ ]; then
	echo "Config folder already exists"
else
	mkdir ~/.config
fi

mv ./dunst/ ~/.config/
mv ./hypr/ ~/.config/
mv ./kitty/ ~/.config/
mv ./rofi/ ~/.config/
mv ./waybar/ ~/.config/
mv ./wezterm/ ~/.config/

mkdir -p ~/.local/share
mv ./.local/bin/ ~/.local/
mv ./.local/fonts/ ~/.local/share/

# Enable packages

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable tor.service
sudo systemctl start tor.service
sudo systemctl enable sddm

# Change SDDM theme
sudo sed -i 's/Current=*/Current=sugar-dark/1' /usr/lib/sddm/sddm.conf.d/default.conf

# Install tresitter
npm install -g tree-sitter
# Install code copy/paste detector (https://github.com/kucherenko/jscpd)
npm install -g jscpd
