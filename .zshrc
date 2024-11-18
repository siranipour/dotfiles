# # ~/.zshrc

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/shayaniranipour/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/shayaniranipour/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/shayaniranipour/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/shayaniranipour/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/shayaniranipour/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/shayaniranipour/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
#

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

alias l="ls"
alias ll="ls -l"

alias cd="z"
alias ..="cd .."

export BAT_THEME=OneHalfDark
alias cat="bat"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

