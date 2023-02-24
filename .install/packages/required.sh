#!/bin/bash
# ------------------------------------------------------
# Check for required packages to run the installation
# ------------------------------------------------------

# Synchronize packages
sudo pacman -Sy
echo
sudo pacman -Sy --needed base-devel git
