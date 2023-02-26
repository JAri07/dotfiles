#!/bin/bash

# If paru is not installed:
if [[ $(sudo _isInstalled "paru") == 0 ]]; then
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	cd ..
	rm -rf paru
	return
fi
