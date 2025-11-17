#!/bin/bash

# Spaces for AeroSpace (not Yabai)
# Uses the custom event `aerospace_workspace_change` triggered by AeroSpace.
# Adds the original style space icons you liked.

# Resolve Aerospace binary (inherited from sketchybarrc if set)
: "${AEROSPACE_BIN:=$HOME/.config/aerospace/aerospace}"
if [ ! -x "$AEROSPACE_BIN" ]; then
  AEROSPACE_BIN="aerospace"
fi

# Icon labels per space (fallbacks to workspace id when out of range)
SPACE_ICONS=(
  "0:~"
  "1:WEB"
  "2:CHAT"
  "3:DEV"
  "4:REVERSE"
  "5:CAPTURE"
  "6:NOTE"
  "7:MEDIA"
  "8:REMOTE"
  "9:Others"
)

SPACE_STYLE=(
  icon.font="$FONT:Bold:12.0"
  icon.color=$ROSE
  icon.highlight_color=$LOVE
  icon.padding_left=10
  icon.padding_right=10
  label.drawing=off
  background.height=22
  background.color=$OVERLAY
  background.corner_radius=8
  background.drawing=off
)

# Create an item per AeroSpace workspace and subscribe to events
for sid in $("$AEROSPACE_BIN" list-workspaces --all); do
  icon_text="$sid"
  if [[ "$sid" =~ ^[0-9]+$ ]]; then
    idx=$sid
    if [ $idx -ge 0 ] && [ $idx -lt ${#SPACE_ICONS[@]} ]; then
      icon_text="${SPACE_ICONS[$idx]}"
    fi
  fi

  sketchybar --add item space.$sid left \
             --subscribe space.$sid aerospace_workspace_change \
             --set space.$sid "${SPACE_STYLE[@]}" \
             icon="$icon_text" \
             click_script="\"$AEROSPACE_BIN\" workspace $sid" \
             script="$PLUGIN_DIR/aerospace.sh $sid"
done
