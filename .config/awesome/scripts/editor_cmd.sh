#ª/bin/bash
if [ $(editor) == 'lvim' ]; then
  alacritty -e sh -c "sleep 0.02 && $HOME/.local/bin/lvim $1"
else
  alacritty -e sh -c "sleep 0.02 && $EDITOR $1"
fi
