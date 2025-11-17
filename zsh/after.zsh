source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pnpm
export PNPM_HOME="/Users/gsoni/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source <(helm completion zsh)

[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

[ -s "/Users/gsoni/.jabba/jabba.sh" ] && source "/Users/gsoni/.jabba/jabba.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gsoni/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gsoni/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gsoni/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gsoni/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/Users/gsoni/.config/aerospace/:$PATH"
