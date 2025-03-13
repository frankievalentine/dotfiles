source $HOME/.aliases

export ZSH_COMPDUMP=$ZSH/.cache/.zcompdump-$HOST

# ohmyzsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="headline"
export XDG_CONFIG_HOME=$HOME/.config

source $ZSH/oh-my-zsh.sh

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

# 1Password-cli shell completion
eval "$(op completion zsh)"; compdef _op op

# Load compinit for compdef in 1Password-cli
autoload -Uz compinit
compinit

# 1Password SSH Agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# fnm - node version manager
eval "$(fnm env --use-on-cd)"

# zoxide smarter cd
eval "$(zoxide init zsh)"
