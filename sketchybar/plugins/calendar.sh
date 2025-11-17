#!/usr/bin/env bash

# Use a widely-supported Nerd Font calendar glyph.
# Fallback to an alternative if needed by simply changing ICON below.
ICON=""
LABEL="$(LC_TIME=en_US.UTF-8 date '+%a %d. %b')"

sketchybar --set "$NAME" \
  icon="$ICON" \
  label="$LABEL"
