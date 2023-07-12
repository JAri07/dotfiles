#!/bin/bash

if lspci -vnn | grep -i nvidia >/dev/null; then
  echo "GPU NVIDIA detected"
  _installPackagesAUR "${NVidia[@]}"
  sudo sed -i "s/MODULES=\(\)/MODULES=\(nvidia nvidia_modeset nvidia_uvm nvidia_drm\)/" /etc/mkinitcpio.conf
  echo "options nvidia_drm modeset=1 fbdev=1" | sudo tee /etc/modprobe.d/nvidia.conf >/dev/null
  sudo mkinitcpio -P
  sed -i "s/^# source/source/" ./hypr/hyprland.conf
else
  echo "No GPU NVIDIA found"
fi
