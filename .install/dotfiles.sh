# ------------------------------------------------------
# Install dotfiles
# ------------------------------------------------------

_installSymLink alacritty ~/.config/alacritty ~/dotfiles/dotfiles/alacritty/ ~/.config
_installSymLink binary ~/.local/bin ~/dotfiles/dotfiles/bin ~/.local
_installSymLink dunst ~/.config/dunst ~/dotfiles/dotfiles/dunst/ ~/.config
_installSymLink fonts ~/.local/share/fonts ~/dotfiles/dotfiles/fonts ~/.local/share
_installSymLink hypr ~/.config/hypr ~/dotfiles/dotfiles/hypr/ ~/.config
_installSymLink rofi ~/.config/rofi ~/dotfiles/dotfiles/rofi/ ~/.config
_installSymLink waybar ~/.config/waybar ~/dotfiles/dotfiles/waybar/ ~/.config
_installSymLink wezterm ~/.config/wezterm ~/dotfiles/dotfiles/wezterm/ ~/.config
_installSymLink zshrc ~/.zshrc ~/dotfiles/dotfiles/.zshrc ~/
echo ":: Symbolic links created."

[[ ! -d "$HOME/.local/share/zap" ]] && zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
