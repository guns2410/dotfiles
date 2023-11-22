plugins=(git history node npm yarn autojump aws brew colorize docker docker-compose fig zsh-autosuggestions)

ZSH_THEME="eastwood"

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh


# Setting for the new UTF-8 terminal support in Lion
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# bun completions
[ -s "/Users/gunjansoni/.bun/_bun" ] && source "/Users/gunjansoni/.bun/_bun"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gunjansoni/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gunjansoni/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gunjansoni/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gunjansoni/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gunjansoni/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gunjansoni/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gunjansoni/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gunjansoni/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


