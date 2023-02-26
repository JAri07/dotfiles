#!/bin/bash
# Synchronize packages
sudo pacman -Sy
_installPackagesPacman "${packagesRequired[*]}"
