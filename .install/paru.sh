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

_isInstalled() {
	package="$1"
	check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
	if [ -n "${check}" ]; then
		echo 1
		return
	fi
	echo 0
	return
}
