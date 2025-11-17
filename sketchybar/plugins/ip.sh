#!/usr/bin/env bash

# Update IP item icon/label based on network/VPN state
# Relies on colors defined in $CONFIG_DIR/colors.sh

source "$CONFIG_DIR/colors.sh" 2>/dev/null || true

IP_ADDRESS=$(scutil --nwi | awk '/address/ {print $NF; exit}')
IS_VPN=$(scutil --nwi | awk '/utun/ {print $1; exit}')

if [[ -n "$IS_VPN" ]]; then
  COLOR=$FOAM
  ICON=""
  LABEL="VPN"
elif [[ -n "$IP_ADDRESS" ]]; then
  COLOR=$ROSE
  ICON=""
  LABEL="$IP_ADDRESS"
else
  COLOR=$MUTED
  ICON=""
  LABEL="Not Connected"
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  label="$LABEL" \
  icon.color=$COLOR

