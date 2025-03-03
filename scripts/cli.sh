#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
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

# Update Corepack (Note: when you update npm you have to do this again)
npm install --global corepack@latest

# Corepack install pnpm, yarn (Note: when npm is updated you have to update/install pnpm and yarn for Corepack)
corepack install --global pnpm@latest
corepack install --global yarn@latest

# yarn
yarn exec env
yarn set version stable

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

# Source .zshrc
source ~/.zshrc

# Brewup one last time
update

echo ""
echo ""
echo "Done. Note that some of these changes require a logout/restart of your OS to take effect.  At a minimum, be sure to restart your Terminal."
echo "------------------------------"
echo ""
