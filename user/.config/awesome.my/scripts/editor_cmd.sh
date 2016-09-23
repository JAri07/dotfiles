#!/bin/env sh
editor="${EDITOR}"
terminal=${TERMINAL}
if [ $editor == "lvim" ]; then
  # $terminal -e sh -c "sleep 0.02 && $HOME/.local/bin/lvim $1"
  kitty -e sh -c "sleep 0.02 && $HOME/.local/bin/lvim $1"
else
  # $terminal -e sh -c "sleep 0.02 && /usr/bin/nvim $1"
  kitty -e sh -c "sleep 0.02 && /usr/bin/nvim $1"
fi
