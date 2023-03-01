#!/bin/bash
# Installation process

source .install/includes/colors.sh
source .install/includes/library.sh
source .install/packages/packages.sh
source .install/packages/required.sh
source .install/packages/aur.sh
source .install/backup.sh
source .install/packages/install-packages.sh
source .install/keyboard.sh
source .install/displaymanager.sh
source .install/neovim.sh

# Copy config files

if [ -d ~/.config/ ]; then
  echo "Config folder already exists"
else
  mkdir ~/.config
fi

cp -r ./alacritty/ ~/.config/
cp -r ./dunst/ ~/.config/
cp -r ./hypr/ ~/.config/
cp -r ./rofi/ ~/.config/
cp -r ./wallpapers/ ~/.config/
cp -r ./waybar/ ~/.config/
cp -r ./wezterm/ ~/.config/

mkdir -p ~/.local/share
cp -r ./.local/bin/ ~/.local/
cp -r ./.local/fonts/ ~/.local/share/
