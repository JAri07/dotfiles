#!/bin/bash

# Check for running NetworkManager.service
if [[ $(systemctl list-units --all -t service --full --no-legend "NetworkManager.service" | sed 's/^\s*//g' | cut -f1 -d' ') == "NetworkManager.service" ]]; then
  echo ":: NetworkManager.service already running."
else
  sudo systemctl enable NetworkManager.service
  sudo systemctl start NetworkManager.service
  echo ":: NetworkManager.service activated successfully."
fi

# Check for running bluetooth.service
if [[ $(systemctl list-units --all -t service --full --no-legend "bluetooth.service" | sed 's/^\s*//g' | cut -f1 -d' ') == "bluetooth.service" ]]; then
  echo ":: bluetooth.service already running."
else
  sudo systemctl enable bluetooth.service
  sudo systemctl start bluetooth.service
  echo ":: bluetooth.service activated successfully."
fi

# Check for running tor.service if installed
if [[ $(_isInstalled "torbrowser") == 0 ]]; then
  if [[ $(systemctl list-units --all -t service --full --no-legend "tor.service" | sed 's/^\s*//g' | cut -f1 -d' ') == "tor.service" ]]; then
    echo ":: tor.service already running."
  else
    sudo systemctl enable tor.service
    sudo systemctl start tor.service
    echo ":: tor.service activated successfully."
  fi
fi
