#!/bin/bash

# Pork in Wogress

# see man zscroll for documentation of the following parameters
zscroll -l 60 \
        --delay 0.1 \
        --scroll-padding "  " \
        --match-command "$HOME/.config/polybar/scripts/get_spotify_status.sh --status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "$HOME/.config/polybar/scripts/get_spotify_status.sh" &

wait
#https://github.com/PrayagS/polybar-spotify
#https://github.com/PrayagS/dotfiles/blob/master/config/polybar/scripts/scroll_spotify_status.sh
