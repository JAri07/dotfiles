#!/bin/bash
# Install LazyVim
echo "SPACE = select/unselect a package to install. RETURN = confirm. No selection = SKIP"

nvimConfigs=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "LazyVim" "NormalNvim")

if [ "${nvimConfigs}" == "*LazyVim*" ]; then
  git clone https://github.com/LazyVim/starter ~/.config/LazyVim
  rm -rf ~/.config/LazyVim/.git
fi

if [ "${nvimConfigs}" == "*NormalNvim*" ]; then
  git clone https://github.com/NormalNvim/NormalNvim.git ~/.config/NormalNvim
fi

cargo install tree-sitter-cli
