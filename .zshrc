# use bat file viewer instead of cat
alias cat="bat -p"
# eza list all with icons
alias l="eza -a -l -g --icons"
# eza list all
alias ls="eza -a"
# eza list file tree
alias lt="eza --tree --level=2 -a"
# list ip
alias ip="ipconfig getifaddr en0"
# list public ip address
alias publicip="curl ifconfig.me && echo"
# produce picture.svg.png from .svg that is 1000 pixels wide
alias convertimage="qlmanage -t -s 1000 -o . picture.svg"
# open zshconfig in vscode
alias zshconfig="code ~/.zshrc"
# show all global packages
alias packages="ls -l /usr/local/bin"
# open a directory in VSCode
alias code='open -b com.microsoft.VSCode'
# shorthand pnpm
alias p="pnpm"
# clean pnpm cache
alias cleanpnpm="pnpm store prune"
# clean node modules
alias npkill="npx npkill"
# kamal
alias kamal='docker run -it --rm -v "${PWD}:/workdir" -v "/run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock" -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/basecamp/kamal:latest'

# global update command
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew doctor; brew autoremove; pnpm up --global"

# start brew cu (cask --latest) update
alias brewcu="brew cu -facy"

# update package.json using bun
alias bunupdatepkg="bunx npm-check-updates -u && bun install"

# update package.json using bun
alias pnpmupdatepkg="pnpx npm-check-updates -u && pnpm install"

# upgrade oh my zsh
# alias ohzshupgrade="upgrade_oh_my_zsh"

# Neovim aliases
alias v='nvim' # default Neovim config
alias vz='NVIM_APPNAME=nvim-lazyvim nvim' # LazyVim
alias vc='NVIM_APPNAME=nvim-nvchad nvim' # NvChad
alias vk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
alias va='NVIM_APPNAME=nvim-astrovim nvim' # AstroVim

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
source /Users/$USER/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source /Users/$USER/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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

# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

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
