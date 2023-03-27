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
  if [ -d "$folder" ]; then
    if [[ -z $(ls -A "$folder") ]]; then
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
  sudo pacman --needed --noconfirm -S "${pkgs[@]}"
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

  if [[ ${#toInstall[@]} -eq 0 ]]; then
    return
  fi

  aur=${aur:-"paru"}
  "${aur}" --noconfirm -S "${toInstall[@]}"
}

_installPackagesNPM() {
  pkgs=$1
  npm install "${pkgs[@]}"
}

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
_installSymLink() {
  symlink="$2"
  linksource="$3"
  linktarget="$4"

  if [ -L "${symlink}" ]; then
    rm "${symlink}"
    ln -s "${linksource}" "${linktarget}"
    echo ":: Symlink ${linksource} -> ${linktarget} created."
  else
    if [ -d "${symlink}" ]; then
      rm -rf "${symlink:?}"
      ln -s "${linksource}" "${linktarget}"
      echo ":: Symlink for directory ${linksource} -> ${linktarget} created."
    else
      if [ -f "${symlink}" ]; then
        rm "${symlink}"
        ln -s "${linksource}" "${linktarget}"
        echo ":: Symlink to file ${linksource} -> ${linktarget} created."
      else
        ln -s "${linksource}" "${linktarget}"
        echo ":: New symlink ${linksource} -> ${linktarget} created."
      fi
    fi
  fi
}
