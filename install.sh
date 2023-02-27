#!/bin/bash
# Installation process

source .install/includes/colors.sh
source .install/includes/library.sh
source .install/packages/required.sh
source .install/packages/packages.sh
source .install/packages/aur.sh
source .install/packages/install-packages.sh
source .install/keyboard.sh
source .install/displaymanager.sh
source .install/neovim.sh

# Move config files

if [ -d ~/.config/ ]; then
  echo "Config folder already exists"
else
  mkdir ~/.config
fi

mv ./dunst/ ~/.config/
mv ./hypr/ ~/.config/
mv ./rofi/ ~/.config/
mv ./waybar/ ~/.config/
mv ./wezterm/ ~/.config/

mkdir -p ~/.local/share
mv ./.local/bin/ ~/.local/
mv ./.local/fonts/ ~/.local/share/
