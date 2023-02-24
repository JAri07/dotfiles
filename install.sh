# Installation process
sudo pacman -Syu --needed base-devel git

# If paru is not installed:
if [[ $(sudo _isInstalled "paru") == 0 ]]; then
	echo "Hello"
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	cd ..
	rm -rf paru
	return
fi

pacman -Sy --needed - <pacman.lst
paru -Sy --needed - <paru.lst

# Install tresitter
npm install -g tree-sitter
# Install code copy/paste detector (https://github.com/kucherenko/jscpd)
npm install -g jscpd

# Enable packages

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable tor.service
sudo systemctl start tor.service
sudo systemctl enable sddm

# Change SDDM theme
sudo sed -i 's/Current=*/Current=sugar-dark/1' /usr/lib/sddm/sddm.conf.d/default.conf

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
