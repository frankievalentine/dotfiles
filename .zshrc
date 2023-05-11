alias cat="bat"
alias l="exa -a -l -g --icons"
alias ls="exa -a"
alias lt="exa --tree --level=2 -a"
alias ip="ipconfig getifaddr en0"
alias publicip="curl ifconfig.me && echo"

alias brewup="brew update; brew upgrade; brew cleanup; brew doctor; brew autoremove;"
alias ohzshupgrade="upgrade_oh_my_zsh"
alias zshconfig="code ~/.zshrc"
alias packages="ls -l /usr/local/bin"
# alias code="open -b com.microsoft.VSCode"

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

# fnm - node version manager
eval "$(fnm env)"

# brew sbin in PATH
export PATH="/usr/local/sbin:$PATH"

# pnpm
export PNPM_HOME="/Users/$USER/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Load compinit for compdef in 1Password-cli
autoload -Uz compinit
compinit

# 1Password-cli shell completion
eval "$(op completion zsh)"; compdef _op op

# Starship initialize
eval "$(starship init zsh)"