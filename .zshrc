# # ~/.zshrc

eval "$(starship init zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Enable vi mode keymaps
set -o vi

# completion using arrow keys (based on history)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# gives fish style arrow key search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='underline'

# Search files using ripgrep
alias rf="rg --files --hidden | rg"

# ---- Eza (better ls) -----
alias ls="eza --icons=always --color=always --git"

alias l="ls"
alias ll="ls -l"

# ---- bat (better cat) -----
export BAT_THEME=OneHalfDark
alias cat="bat -P"
alias less="bat --pager less --paging always"
#
# ---- zoxide (better cd) -----
alias cd="z"
alias ..="cd .."

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

. "$HOME/.local/bin/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shayaniranipour/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shayaniranipour/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shayaniranipour/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shayaniranipour/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
