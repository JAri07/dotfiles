#!/bin/bash

# If paru is not installed:
if [[ $(_isInstalled "paru") == 1 ]]; then
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd ..
  rm -rf paru
  return
fi
