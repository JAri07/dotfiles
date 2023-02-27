#!/bin/bash
echo -e "${GREEN}"
figlet "Keyboard"
echo -e "${NONE}"

# Default layout and variants
keyboard_layout="us"

_setupKeyboardLayout() {
  echo ""
  echo "Start typing = Search, RETURN = Confirm, CTRL-C = Cancel"
  keyboard_layout=$(localectl list-x11-keymap-layouts | gum filter --height 15 --placeholder "Find your keyboard layout...")
  echo ""
  echo ":: Keyboard layout changed to $keyboard_layout"
  echo ""
  _confirmKeyboard
}

_confirmKeyboard() {
  echo "Current selected keyboard setup:"
  echo "Keyboard layout: $keyboard_layout"
  if gum confirm "Do you want proceed with this keyboard setup?" --affirmative "Proceed" --negative "Change"; then
    return 0
  elif [ $? -eq 130 ]; then
    exit 130
  else
    _setupKeyboardLayout
  fi
}

_confirmKeyboard

SEARCH="KEYBOARD_LAYOUT"
REPLACE="$keyboard_layout"
sed -i "s/$SEARCH/$REPLACE/g" ./hypr/conf/keyboard.conf
