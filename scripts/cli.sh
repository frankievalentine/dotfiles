#!/bin/sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew. Have to have .zshrc alias' setup first before 'update' command.
update

# Install starship prompt
brew install starship
eval "$(starship init zsh)"

# Install fnm node version manager
brew install fnm
eval "$(fnm env --use-on-cd)"
fnm install --lts --corepack-enabled

# Dev tools after install of Node
# pnpm
brew install pnpm

# yarn
yarn exec env
yarn set version berry

# PlanetScale CLI
brew install planetscale/tap/pscale

# Global packages (Not recommended now using run scripts instead)
# pnpm add -g tsc
# pnpm add -g vercel
# pnpm add -g gatsby-cli
# pnpm add -g @vue/cli
# pnpm add -g netlify-cli
# pnpm add -g @11ty/eleventy
# pnpm add -g @sveltejs/kit
# pnpm add -g lighthouse
# pnpm add -g composerize

# Zsh plugins
mkdir ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Warp themes
mkdir ~/.warp
git clone https://github.com/warpdotdev/themes.git ~/.warp/

# Source .zshrc
source ~/.zshrc

# Brewup one last time
update

echo ""
echo ""
echo "Done. Note that some of these changes require a logout/restart of your OS to take effect.  At a minimum, be sure to restart your Terminal."