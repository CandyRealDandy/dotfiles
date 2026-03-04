#!/bin/bash

# TODO: script is not accurate just a proof of concept

open -a "WhatsApp"
open -a "Telegram"

sleep 1

# Get display dimensions
DISPLAY_WIDTH=$(yabai -m query --displays --display | jq '.frame.w')
DISPLAY_HEIGHT=$(yabai -m query --displays --display | jq '.frame.h')

# Calculate positions (example: 55% and 45% split)
WA_WIDTH=$(echo "$DISPLAY_WIDTH * 0.55" | bc | cut -d. -f1)
TG_WIDTH=$(echo "$DISPLAY_WIDTH * 0.45" | bc | cut -d. -f1)
WA_X=10
TG_X=$(echo "$WA_X + $WA_WIDTH + 10" | bc)  # Gap of 10px
HEIGHT=$(echo "$DISPLAY_HEIGHT - 100" | bc)  # Leave some padding

WID_WA=$(yabai -m query --windows | jq -r '.[] | select(.app | contains("WhatsApp")).id')
WID_TG=$(yabai -m query --windows | jq -r '.[] | select(.app | contains("Telegram")).id')

[ -n "$WID_WA" ] && yabai -m window $WID_WA --move abs:$WA_X:42 && \
                     yabai -m window $WID_WA --resize abs:$WA_WIDTH:$HEIGHT

[ -n "$WID_TG" ] && yabai -m window $WID_TG --move abs:$TG_X:42 && \
                     yabai -m window $WID_TG --resize abs:$TG_WIDTH:$HEIGHT