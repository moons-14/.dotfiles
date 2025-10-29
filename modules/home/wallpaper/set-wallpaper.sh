#!/usr/bin/env bash
# set-wallpaper.sh
set -euo pipefail

WALLS="${HOME}/wallpapers"

# Pick up wallpaper（jpg/jpeg/png/webp）
mapfile -t files < <(find "$WALLS" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \))
[[ ${#files[@]} -gt 0 ]] || exit 0

pick="${files[RANDOM % ${#files[@]}]}"

exec swww img "$pick" --transition-type any --transition-step 90 --transition-fps 60
