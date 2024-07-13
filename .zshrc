# global update command
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew doctor; brew autoremove;"

# use bat file viewer instead of cat
alias cat="bat"
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
# always use pnpm instead of npm (optional)
# alias npm="pnpm"

# start brew cu (cask --latest) update
alias brewcu="brew cu -facy"

# update package.json using bun
alias bunupdatepkg="bunx npm-check-updates -u && bun install"

# update package.json using bun
alias pnpmupdatepkg="pnpx npm-check-updates -u && pnpm install"

Window Title with Host/Directory
function precmd () {
  window_title="\033]0;$HOSTNAME👱🏻‍${PWD##*/}\007"
  echo -ne "$window_title"
}

# zsh-syntax-highlighting
source /Users/$USER/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source /Users/$USER/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || truesdf

# brew sbin in PATH
export PATH="/usr/local/sbin:$PATH"

# warp new line prompt
PROMPT="${PROMPT}"$'\n'

# libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# zoxide smarter cd
eval "$(zoxide init zsh)"

# Load compinit for compdef in 1Password-cli
autoload -Uz compinit
compinit

# 1Password-cli shell completion
eval "$(op completion zsh)"; compdef _op op

# 1Password SSH Agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# fnm - node version manager
eval "$(fnm env --use-on-cd)"


# Starship initialize
eval "$(starship init zsh)"
