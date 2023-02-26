#!/bin/bash
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesParu "${packagesParu[@]}"

read -p "Do you want to install optional packages? (y/n) " yn

case $yn in
[yY])
  _installPackagesPacman "${optionalPackagesPacman[@]}"
  _installPackagesPacman "${latexPacman[@]}"
  break
  ;;
*) echo ;;
esac
