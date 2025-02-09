#! /bin/bash

fallback="/home/hardeol/.config/hyde/themes/Synth Wave/wallpapers/glitch fox.png"
wallpaper="/home/hardeol/.cache/hyde/wall.set"

current_theme=$(readlink -f "$wallpaper")

if [[ "$(echo -n "$current_theme" | tail -c 4)" == ".gif" ]]; then
    current_theme="$fallback"
fi

awk -v path="$current_theme" 'NR==4 {$0="    path = " path} {print}' /home/hardeol/.config/hypr/hyprlock.conf > temp.conf && mv temp.conf /home/hardeol/.config/hypr/hyprlock.conf
