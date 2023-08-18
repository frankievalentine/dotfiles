# use bat file viewer instead of cat
alias cat="bat"
# exa list all with icons
alias l="exa -a -l -g --icons"
# exa list all
alias ls="exa -a"
# exa list file tree
alias lt="exa --tree --level=2 -a"
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
# always use pnpm instead of npm
alias npm="pnpm"
# alias code="open -b com.microsoft.VSCode"


# global brew command
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor; brew autoremove;"

# start brew cu (cask --latest) update
alias brewcu="brew cu -facy"

# upgrade oh my zsh
# alias ohzshupgrade="upgrade_oh_my_zsh"


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