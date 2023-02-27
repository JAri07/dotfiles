echo -e "${GREEN}"
figlet "Display Manager"
echo -e "${NONE}"

if [ -f /etc/systemd/system/display-manager.service ]; then
	display_manager=$(basename $(cat /etc/systemd/system/display-manager.service | grep "ExecStart" | cut -d '=' -f 2))
	echo "You have already installed a display manager on your system: ${display_manager}"
	echo "If your display manager is working fine, you can keep the current setup."
	echo "How do you want to proceed?"
	dmsel=$(gum choose "Keep current setup" "Deactivate current display manager" "Install sddm and theme")
else
	echo "There is no display manager installed on your system."
	echo "After the installation/update of the dotfiles, you can start Hyprland with command Hyprland"
	echo "How do you want to proceed?"
	dmsel=$(gum choose "Keep current setup" "Install sddm and theme")
fi

if [ -z "${dmsel}" ]; then
	echo "Installation canceled."
	exit
fi
if [ "$dmsel" == "Install sddm and theme" ]; then

	themes=$(gum choose --no-limit --cursor-prefix "( ) " --selected-prefix "(x) " --unselected-prefix "( ) " "sugar-dark" "sddm-sugar-candy-git")
	selectedThemes=(${themes// / })

	_installPackagesAUR "${selectedThemes[@]}"

	if [ -f /etc/systemd/system/display-manager.service ]; then
		sudo rm /etc/systemd/system/display-manager.service
	fi
	sudo systemctl enable sddm.service

	echo "Select your theme:"
	dmtheme=$(gum choose $(ls /usr/share/sddm/themes))

	sudo sed -i "s/Current=.*$/Current=${dmtheme}/" /usr/lib/sddm/sddm.conf.d/default.conf

elif [ "$dmsel" == "Deactivate current display manager" ]; then
	sudo rm /etc/systemd/system/display-manager.service
	echo "Current display manager deactivated."
else
	echo "Keep current setup."
fi
