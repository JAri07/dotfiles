#!/bin/bash
# Installation process

source .install/includes/colors.sh
source .install/includes/library.sh
source .install/packages/paralleldownloads.sh
source .install/packages/packages.sh
source .install/packages/required.sh
source .install/packages/aur.sh
source .install/backup.sh
source .install/packages/install-packages.sh
source .install/packages/activate-services.sh
source .install/create-folder.sh
source .install/keyboard.sh
source .install/displaymanager.sh
source .install/neovim.sh

# Copy config files

if [ -d ~/.config/ ]; then
  echo "Config folder already exists"
else
  mkdir ~/.config
fi

ln -s ./alacritty/ ~/.config/alacritty
ln -s ./dunst/ ~/.config/dunst
ln -s ./hypr/ ~/.config/hypr
ln -s ./rofi/ ~/.config/rofi
ln -s ./wallpapers/ ~/.config/wallpapers
ln -s ./waybar/ ~/.config/waybar
ln -s ./wezterm/ ~/.config/wezterm

if [[ ! -d ~/.local/share ]]; then
  mkdir -p ~/.local/share
fi
ln -l ./.local/bin/ ~/.local/bin
ln -l ./.local/fonts/ ~/.local/share/fonts
