#!/bin/sh

# Script to clear pacman and paru (or your favourite aur helper) cache
echo ""
echo "── $(date +%T) - Package clear ────────────────────────────────────────────────────"

# The location of the cache for your aur helper
PARU_CACHE_DIR=$HOME/.cache/paru/clone
YAY_CACHE_DIR=$HOME/.cache/yay

# Get all cache directories for AUR helper
PARU_CACHE_REMOVED="$(find "$PARU_CACHE_DIR" -maxdepth 1 -type d | awk '{ print "-c " $1 }' | tail -n +2)"
YAY_CACHE_REMOVED="$(find "$YAY_CACHE_DIR" -maxdepth 1 -type d | awk '{ print "-c " $1 }' | tail -n +2)"
# Remove everything for uninstalled AUR packages
PARU_REMOVED=$(/usr/bin/paccache -ruvk0 "$PARU_CACHE_REMOVED" | sed '/.cache/!d' | cut -d \' -f2 | rev | cut -d / -f2- | rev)
[ -z "$PARU_REMOVED" ] || rm -rf "$PARU_REMOVED"
YAY_REMOVED=$(/usr/bin/paccache -ruvk0 "$YAY_CACHE_REMOVED" | sed '/.cache/!d' | cut -d \' -f2 | rev | cut -d / -f2- | rev)
[ -z "$YAY_REMOVED" ] || rm -rf "$YAY_REMOVED"

# Keep latest version for uninstalled native packages, keep two latest versions for installed packages
# Get all cache directories for AUR helper (without removed packages)
PARU_CACHE="$(find "$PARU_CACHE_DIR" -maxdepth 1 -type d | awk '{ print "-c " $1 }' | tail -n +2)"
YAY_CACHE="$(find "$YAY_CACHE_DIR" -maxdepth 1 -type d | awk '{ print "-c " $1 }' | tail -n +2)"
/usr/bin/paccache -vrk2 -c /var/cache/pacman/pkg "$PARU_CACHE" "$YAY_CACHE"
/usr/bin/paccache -vruk2
# /usr/bin/paccache -vrk2 -c /var/cache/pacman/pkg $PARU_CACHE $YAY_CACHE
