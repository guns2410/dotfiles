#!/bin/bash

# IP item definition for SketchyBar (uses plugins/ip.sh to update)

IP_ITEM=(
  icon.padding_left=12
  label.padding_right=12
  label.font="$FONT:Bold:12.0"
  label.color=$LOVE
  icon.font="$ICON_FONT:Bold:16.0"
  icon=
  background.height=26
  background.color=$OVERLAY
  background.corner_radius=10
  script="$PLUGIN_DIR/ip.sh"
)

sketchybar --add item ip right --set ip "${IP_ITEM[@]}" update_freq=15
