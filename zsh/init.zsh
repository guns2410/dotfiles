export XDG_CONFIG_HOME="$HOME/.config"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$XDG_CONFIG_HOME/zsh/secrets.zsh"
source "$XDG_CONFIG_HOME/zsh/env.zsh"
source "$XDG_CONFIG_HOME/zsh/config.zsh"
source "$XDG_CONFIG_HOME/zsh/alias.zsh"
source "$XDG_CONFIG_HOME/zsh/functions.zsh"
source "$XDG_CONFIG_HOME/zsh/private_functions.zsh"
source "$XDG_CONFIG_HOME/zsh/after.zsh"
