# ------------------------------------------------------
# Backup existing dotfiles
# ------------------------------------------------------

datets=$(date '+%Y%m%d%H%M%S')

# Create Backup File Structure

if [ ! -d ~/dotfiles-versions ]; then
  mkdir ~/dotfiles-versions
  echo "~/dotfiles-versions created."
fi
if [ ! -d ~/dotfiles-versions/backup ]; then
  mkdir ~/dotfiles-versions/backup
  echo "~/dotfiles-versions/backup created"
fi
if [ -d ~/dotfiles-versions/backups ]; then
  mv ~/dotfiles-versions/backups ~/dotfiles-versions/archive
  echo ":: Existing backups moved into ~/dotfiles-versions/archive"
fi
if [ ! -d ~/dotfiles-versions/archive ]; then
  mkdir ~/dotfiles-versions/archive
  echo "~/dotfiles-versions/archive created"
fi

# Backup Existing Dotfiles

if [ -d ~/.config ] || [ -e ~/.zshrc ]; then

  echo -e "${GREEN}"
  figlet "Backup"
  echo -e "${NONE}"
  echo "The script has detected the following files and folders for a backup:"

  if [ -d ~/.config ]; then
    echo "   - $HOME/.config"
  fi
  if [ -e ~/.zshrc ]; then
    echo "   - $HOME/.zshrc"
  fi
  if [ -d ~/.config/alacritty ]; then
    echo "   - $HOME/.config/alacritty/"
  fi
  if [ -d ~/.config/dunst ]; then
    echo "   - $HOME/.config/dunst/"
  fi
  if [ -d ~/.config/hypr ]; then
    echo "   - $HOME/.config/hypr/"
  fi
  if [ -d ~/.config/rofi ]; then
    echo "   - $HOME/.config/rofi/"
  fi
  if [ -d ~/.config/wallpapers ]; then
    echo "   - $HOME/.config/wallpapers/"
  fi
  if [ -d ~/.config/waybar ]; then
    echo "   - $HOME/.config/waybar/"
  fi
  if [ -d ~/.config/wezterm ]; then
    echo "   - $HOME/.config/wezterm/"
  fi

  # Start Backup

  if gum confirm "Do you want to create a backup?"; then

    if [ ! -z "$(ls -A ~/dotfiles-versions/backup)" ]; then
      if gum confirm "Do you want to archive the existing backup?"; then
        rsync -a ~/dotfiles-versions/backup/ ~/dotfiles-versions/archive/$datets/
        echo ":: Current backup archived in ~/dotfiles-versions/archive/$datets"
      fi
    fi
    if [ -d ~/dotfiles ]; then
      rsync -a ~/dotfiles ~/dotfiles-versions/backup/
      echo ":: Backup of $HOME/dotfiles created in ~/dotfiles-versions/backup"
    fi
    if [ -e ~/.zshrc ]; then
      cp ~/.zshrc ~/dotfiles-versions/backup
      echo ":: Backup of $HOME/.zshrc created in ~/dotfiles-versions/backup"
    fi
    if [ ! -d ~/dotfiles-versions/backup/config ]; then
      mkdir ~/dotfiles-versions/backup/config
    fi
    if [ -d ~/.config/alacritty ]; then
      cp -r ~/.config/alacritty ~/dotfiles-versions/backup/config
      echo ":: Backup of $HOME/.config/alacritty created in ~/dotfiles-versions/backup/config/"
    fi
    if [ -d ~/.config/dunst ]; then
      cp -r ~/.config/dunst ~/dotfiles-versions/backup/config
      echo ":: Backup of $HOME/.config/dunst created in ~/dotfiles-versions/backup/config/"
    fi
    if [ -d ~/.config/hypr ]; then
      cp -r ~/.config/hypr ~/dotfiles-versions/backup/config
      echo ":: Backup of $HOME/.config/hypr created in ~/dotfiles-versions/backup/config/"
    fi
    if [ -d ~/.config/rofi ]; then
      cp -r ~/.config/rofi ~/dotfiles-versions/backup/config
      echo ":: Backup of $HOME/.config/rofi created in ~/dotfiles-versions/backup/config/"
    fi
    if [ -d ~/.config/wallpapers ]; then
      cp -r ~/.config/wallpapers ~/dotfiles-versions/backup/config
      echo ":: Backup of $HOME/.config/wallpapers created in ~/dotfiles-versions/backup/config/"
    fi
    if [ -d ~/.config/waybar ]; then
      cp -r ~/.config/waybar ~/dotfiles-versions/backup/config
      echo ":: Backup of $HOME/.config/waybar created in ~/dotfiles-versions/backup/config/"
    fi
    if [ -d ~/.config/wezterm ]; then
      cp -r ~/.config/wezterm ~/dotfiles-versions/backup/config
      echo ":: Backup of $HOME/.config/wezterm created in ~/dotfiles-versions/backup/config/"
    fi
  elif [ $? -eq 130 ]; then
    exit 130
  else
    echo ":: Backup skipped."
  fi
else
  echo ":: Nothing to backup"
fi
