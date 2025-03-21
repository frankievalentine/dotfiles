#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run the mac script
echo ""
echo "------------------------------"
echo "Setting up system defaults and Brewfile bundle"
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
chmod +x ~/.dotfiles/scripts/mac.sh
echo "------------------------------"
echo "Executing"
echo ""
sh ~/.dotfiles/scripts/mac.sh && brew bundle

# Run the tools script
echo ""
echo "------------------------------"
echo "Setting up ohmyzsh, fnm, & corepack"
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
chmod +x ~/.dotfiles/scripts/tools.sh
echo "------------------------------"
echo "Executing"
echo ""
sh ~/.dotfiles/scripts/tools.sh

# Create SSH key
echo ""
echo "------------------------------"
echo "Creating SSH key"
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
chmod +x ~/.dotfiles/scripts/ssh.sh
echo "------------------------------"
echo "Executing"
echo ""
sh ~/.dotfiles/scripts/ssh.sh

# Finished
echo "------------------------------"
echo "------------------------------"
echo ""
echo "Completed running .dots! Restarting terminal session and final updates. Be sure to also restart your computer as soon as possible then proceed with the manual application setup."
echo ""
echo "------------------------------"
echo "------------------------------"

# Restarting terminal session and updating Homebrew
exec $SHELL

# Final updates
source ~/.aliases
update
