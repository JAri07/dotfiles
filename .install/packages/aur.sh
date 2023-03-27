#!/bin/bash

aur=$(gum choose --limit 1 "yay" "paru")

if [[ $(_isInstalled "${aur}") == 1 ]]; then
  git clone https://aur.archlinux.org/"${aur}".git
  cd "${aur}" || return
  makepkg -si
  cd ..
  rm -rf "${aur}"
  return
fi
