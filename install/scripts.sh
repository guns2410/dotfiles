git clone https://github.com/catppuccin/lazygit.git ~/.config/lazygit-themes
defaults import com.manytricks.Moom ./Moom.plist

# Alacritty font AppleFontSmoothing
ddefaults write org.alacritty AppleFontSmoothing -int 0

# show dock faster
defaults write com.apple.dock autohide-delay -float 0; killall Dock

# install sdkman
curl -s "https://get.sdkman.io" | bash

# key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
