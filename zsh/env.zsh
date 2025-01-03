export XDG_CONFIG_HOME="$HOME/.config"

# Pixsy
export PIXSY_ROOT=/Users/gunjansoni/work/pixsy/pixsy-root
export PATH="/usr/local/opt/openjdk/bin:$PATH"

#NVIM
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

#openjdk
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export FORCE_COLOR=1

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/gunjansoni/.oh-my-zsh"

# export SF_CONTENT_TYPE="JSON"

# For docker to work correclty
export DOCKER_DEFAULT_PLATFORM=linux/amd64

export LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit-themes/themes/mocha/lavender.yml"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

. "$HOME/.cargo/env"
