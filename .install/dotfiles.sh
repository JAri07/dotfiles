# ------------------------------------------------------
# Install dotfiles
# ------------------------------------------------------

_installSymLink alacritty ~/.config/alacritty ~/dotfiles/alacritty/ ~/.config
_installSymLink dunst ~/.config/dunst ~/dotfiles/dunst/ ~/.config
_installSymLink hypr ~/.config/hypr ~/dotfiles/hypr/ ~/.config
_installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
_installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config
_installSymLink wezterm ~/.config/wezterm ~/dotfiles/wezterm/ ~/.config
_installSymLink binary ~/.local/bin ~/dotfiles/.local/bin ~/.local
_installSymLink fonts ~/.local/share/fonts ~/dotfiles/.local/fonts ~/.local/share
echo ":: Symbolic links created."
