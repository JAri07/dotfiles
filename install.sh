#!/bin/bash
# Installation process

source .install/includes/colors.sh
source .install/includes/library.sh
source .install/packages/required.sh
source .install/packages/packages.sh
source .install/packages/aur.sh
source .install/packages/install-packages.sh
source .install/keyboard.sh
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

# Enable packages

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable tor.service
sudo systemctl start tor.service
sudo systemctl enable sddm

# Change SDDM theme
sudo sed -i 's/Current=*/Current=sugar-dark/1' /usr/lib/sddm/sddm.conf.d/default.conf
