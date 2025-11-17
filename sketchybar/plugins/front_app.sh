#!/usr/bin/env bash

# Front app icon/label updater.
# Uses icon_map.sh for high-fidelity app icons (sketchybar-app-font).
# If that returns a token like :app_name: and the font isn't available,
# fall back to common Nerd Font glyphs so you don't see raw ":name:" text.

nf_fallback_icon() {
  case "$1" in
    *Ghostty*|*WezTerm*|*iTerm*|*Terminal*|*kitty*) echo "" ;;
    *Arc*|*Safari*|*Firefox*|*Chromium*|*Chrome*|*Brave*|*Edge*) echo "" ;;
    *Code*|*Zed*|*Nova*|*VSCodium*|*Xcode*|*JetBrains*|*PyCharm*|*WebStorm*|*GoLand*|*Rider*|*DataGrip*) echo "" ;;
    *Slack*|*Discord*|*Telegram*|*Messages*|*Mattermost*|*WeChat*|*WhatsApp*) echo "" ;;
    *Mail*|*Outlook*) echo "" ;;
    *Finder*|*Files*|*ForkLift*|*Transmit*) echo "" ;;
    *Notes*|*Obsidian*|*Notion*|*Bear*|*FSNotes*) echo "" ;;
    *Calendar*|*Cron*|*Fantastical*) echo "" ;;
    *Music*|*Spotify*|*TIDAL*|*Plexamp*|*IINA*|*VLC*) echo "" ;;
    *Maps*|*Map*) echo "" ;;
    *Settings*|*Preferences*|*System*) echo "" ;;
    *) echo "" ;;
  esac
}

if [ "$SENDER" = "front_app_switched" ]; then
  app_name="$INFO"
  mapped_icon="$($CONFIG_DIR/plugins/icon_map.sh "$app_name")"

  if [[ "$mapped_icon" =~ ^:.*:$ ]]; then
    # sketchybar-app-font likely not available; use NF fallback and set a NF font
    fallback_icon="$(nf_fallback_icon "$app_name")"
    sketchybar --set "$NAME" \
      icon.font="JetBrainsMono Nerd Font:Bold:16.0" \
      icon="$fallback_icon" \
      label="$app_name"
  else
    # High-fidelity icon returned; keep configured icon font
    sketchybar --set "$NAME" label="$app_name" icon="$mapped_icon"
  fi
fi
