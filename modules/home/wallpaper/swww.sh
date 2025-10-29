#!/usr/bin/env bash

WALLPAPERS_DIR="${HOME}/wallpapers"

mapfile -t files < <(find "$WALLPAPERS_DIR" -type f 2>/dev/null)
[ "${#files[@]}" -eq 0 ] && exit 0

file="$(printf '%s\n' "${files[@]}" | shuf -n 1)"


exec swww img "$file" --transition-type grow --transition-step 90
