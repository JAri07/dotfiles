#!/bin/sh

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

cd ..
rm -Rf paru
sudo pacman -Syu sddm bat exa mdcat brightnessctl nemo fzf pacman-contrib man-db lazygit
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
sudo pacman -S python-pip python npm nodejs rust
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
paru -S rofi-lbonn-wayland-git sddm-sugar-dark hyprpaper-git grim slurp sioyek hyprland-nvidia
cp -r user/.config/rofi ~/.config/
cp -r user/.config/dunst ~/.config/
cp -r user/.config/hypr ~/.config/
cp -r user/.config/waybar ~/.config/
cp -r user/.config/kitty ~/.config/

mkdir -p ~/.local/share/fonts
cp -r user/.local/fonts/* ~/.local/share/fonts
mkdir -p ~/.local/bin
cp -r user/.local/bin/* ~/.local/bin
cp user/.zshrc ~/

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) -y
