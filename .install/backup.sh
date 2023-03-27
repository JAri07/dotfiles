# ------------------------------------------------------
# Backup existing dotfiles
# ------------------------------------------------------

datets=$(date '+%Y%m%d%H%M%S')

# Create Backup File Structure

if [ ! -d "$HOME/dotfiles-versions" ]; then
  mkdir "$HOME/dotfiles-versions"
  echo "$HOME/dotfiles-versions created."
fi
if [ ! -d "$HOME/dotfiles-versions/backup" ]; then
  mkdir "$HOME/dotfiles-versions/backup"
  echo "$HOME/dotfiles-versions/backup created"
fi
if [ -d "$HOME/dotfiles-versions/backups" ]; then
  mv "$HOME/dotfiles-versions/backups" "$HOME/dotfiles-versions/archive"
  echo ":: Existing backups moved into $HOME/dotfiles-versions/archive"
fi
if [ ! -d "$HOME/dotfiles-versions/archive" ]; then
  mkdir "$HOME/dotfiles-versions/archive"
  echo "$HOME/dotfiles-versions/archive created"
fi

# Backup Existing Dotfiles

if [ -d "$HOME/.config" ] || [ -e "$HOME/.zshrc" ]; then

  echo -e "${GREEN}"
  figlet "Backup"
  echo -e "${NONE}"
  echo "The script has detected the following files and folders for a backup:"

  if [ -d "$HOME/.config" ]; then
    echo "   - $HOME/.config"
  fi
  if [ -e "$HOME/.zshrc" ]; then
    echo "   - $HOME/.zshrc"
  fi
  if [ -d "$HOME/.config/alacritty" ]; then
    echo "   - $HOME/.config/alacritty/"
  fi
  if [ -d "$HOME/.config/dunst" ]; then
    echo "   - $HOME/.config/dunst/"
  fi
  if [ -d "$HOME/.config/hypr" ]; then
    echo "   - $HOME/.config/hypr/"
  fi
  if [ -d "$HOME/.config/rofi" ]; then
    echo "   - $HOME/.config/rofi/"
  fi
  if [ -d "$HOME/.config/wallpapers" ]; then
    echo "   - $HOME/.config/wallpapers/"
  fi
  if [ -d "$HOME/.config/waybar" ]; then
    echo "   - $HOME/.config/waybar/"
  fi
  if [ -d "$HOME/.config/wezterm" ]; then
    echo "   - $HOME/.config/wezterm/"
  fi

  # Start Backup

  if gum confirm "Do you want to create a backup?"; then

    if [[ -n $(ls -A "${HOME}/dotfiles-versions/backup") ]]; then
      if gum confirm "Do you want to archive the existing backup?"; then
        rsync -a "$HOME/dotfiles-versions/backup/" "$HOME/dotfiles-versions/archive/$datets/"
        echo ":: Current backup archived in $HOME/dotfiles-versions/archive/$datets"
      fi
    fi
    if [ -d "$HOME/dotfiles" ]; then
      rsync -a "$HOME/dotfiles" "$HOME/dotfiles-versions/backup/"
      echo ":: Backup of $HOME/dotfiles created in $HOME/dotfiles-versions/backup"
    fi
    if [ -e "$HOME/.zshrc" ]; then
      cp "$HOME/.zshrc" "$HOME/dotfiles-versions/backup"
      echo ":: Backup of $HOME/.zshrc created in $HOME/dotfiles-versions/backup"
    fi
    if [ ! -d "$HOME/dotfiles-versions/backup/config" ]; then
      mkdir "$HOME/dotfiles-versions/backup/config"
    fi
    if [ -d "$HOME/.config/alacritty" ]; then
      cp -r "$HOME/.config/alacritty" "$HOME/dotfiles-versions/backup/config"
      echo ":: Backup of $HOME/.config/alacritty created in $HOME/dotfiles-versions/backup/config/"
    fi
    if [ -d "$HOME/.config/dunst" ]; then
      cp -r "$HOME/.config/dunst" "$HOME/dotfiles-versions/backup/config"
      echo ":: Backup of $HOME/.config/dunst created in $HOME/dotfiles-versions/backup/config/"
    fi
    if [ -d "$HOME/.config/hypr" ]; then
      cp -r "$HOME/.config/hypr" "$HOME/dotfiles-versions/backup/config"
      echo ":: Backup of $HOME/.config/hypr created in $HOME/dotfiles-versions/backup/config/"
    fi
    if [ -d "$HOME/.config/rofi" ]; then
      cp -r "$HOME/.config/rofi" "$HOME/dotfiles-versions/backup/config"
      echo ":: Backup of $HOME/.config/rofi created in $HOME/dotfiles-versions/backup/config/"
    fi
    if [ -d "$HOME/.config/wallpapers" ]; then
      cp -r "$HOME/.config/wallpapers" "$HOME/dotfiles-versions/backup/config"
      echo ":: Backup of $HOME/.config/wallpapers created in $HOME/dotfiles-versions/backup/config/"
    fi
    if [ -d "$HOME/.config/waybar" ]; then
      cp -r "$HOME/.config/waybar" "$HOME/dotfiles-versions/backup/config"
      echo ":: Backup of $HOME/.config/waybar created in $HOME/dotfiles-versions/backup/config/"
    fi
    if [ -d "$HOME/.config/wezterm" ]; then
      cp -r "$HOME/.config/wezterm" "$HOME/dotfiles-versions/backup/config"
      echo ":: Backup of $HOME/.config/wezterm created in $HOME/dotfiles-versions/backup/config/"
    fi
  elif [ $? -eq 130 ]; then
    exit 130
  else
    echo ":: Backup skipped."
  fi
else
  echo ":: Nothing to backup"
fi
