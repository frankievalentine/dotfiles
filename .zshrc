source $HOME/.aliases

# Neovim fzf config selection
vv() {
  # Assumes all configs exist in directories named ~/.config/nvim-*
  local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)
 
  # If I exit fzf without selecting a config, don't open Neovim
  [[ -z $config ]] && echo "No config selected" && return
 
  # Open Neovim with the selected config
  NVIM_APPNAME=$(basename $config) nvim
}

# Window Title with Host/Directory
# function precmd () {
#   window_title="\033]0;$HOSTNAME👱🏻‍${PWD##*/}\007"
#   echo -ne "$window_title"
# }

# Window Title with ⌐◨-◨
function precmd () {
  echo -ne "\033]0;⌐◨-◨  $(pwd | sed -e "s;^$HOME;~;")\a"
}

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# old n-install node version manager
# install n to home directory instead of usr/local to ignore 'brew doctor' errors
# export N_PREFIX=$HOME/.n
# export PATH=$N_PREFIX/bin:$PATH

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || truesdf

# brew sbin in PATH
export PATH="/usr/local/sbin:$PATH"

# warp new line prompt
PROMPT="${PROMPT}"$'\n'

# libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pnpm (Now managed using Corepack)
# export PNPM_HOME="/Users/$USER/Library/pnpm"
# export PATH="$PNPM_HOME:$PATH"

# Load compinit for compdef in 1Password-cli
autoload -Uz compinit
compinit

# 1Password-cli shell completion
eval "$(op completion zsh)"; compdef _op op

# 1Password SSH Agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# fnm - node version manager
eval "$(fnm env --use-on-cd)"

# zoxide smarter cd
eval "$(zoxide init zsh)"

# Starship initialize
eval "$(starship init zsh)"
