#!/bin/sh

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -Rf paru
pacman -Sy --needed - <pacman.lst
paru -Sy --needed - <paru.lst
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
sudo pacman -S python-pip python npm nodejs rust
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
cp -r .config/rofi ~/.config/
cp -r .config/dunst ~/.config/
cp -r .config/hypr ~/.config/
cp -r .config/waybar ~/.config/
cp -r .config/kitty ~/.config/

mkdir -p ~/.local/share/fonts
cp -r .local/fonts/* ~/.local/share/fonts
mkdir -p ~/.local/bin
cp -r .local/bin/* ~/.local/bin
cp .zshrc ~/

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) -y
