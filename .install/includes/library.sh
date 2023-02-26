#!/bin/bash
# ------------------------------------------------------
# Function: Check if package is installed
# ------------------------------------------------------
_isInstalled() {
  package="$1"
  check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
  if [ -n "${check}" ]; then
    echo 0 #'0' means 'true' in Bash
    return #true
  fi
  echo 1 #'1' means 'false' in Bash
  return #false
}

# ------------------------------------------------------
# Function: Check if folder is empty
# ------------------------------------------------------
_isFolderEmpty() {
  folder="$1"
  if [ -d $folder ]; then
    if [ -z "$(ls -A $folder)" ]; then
      echo 0
    else
      echo 1
    fi
  else
    echo 1
  fi
}

# ------------------------------------------------------
# Function Install all package if not installed
# ------------------------------------------------------
_installPackagesPacman() {
  pkgs=$1
  sudo pacman --needed --noconfirm -S ${pkgs[@]}
}

_installPackagesAUR() {
  toInstall=()
  for pkg; do
    if [[ $(_isInstalled "${pkg}") == 0 ]]; then
      echo ":: ${pkg} is already installed."
      continue
    fi
    toInstall+=("${pkg}")
  done

  if [[ "${toInstall[@]}" == "" ]]; then
    return
  fi

  "${aur}" --noconfirm -S "${toInstall[@]}"
}
