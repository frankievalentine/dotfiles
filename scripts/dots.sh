#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run the mac script
echo ""
echo "------------------------------"
echo "Setting up system defaults and executing Brewfile"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ~/.dotfiles/scripts/mac.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/.dotfiles/scripts/mac.sh && brew bundle

# Run the cli script
echo ""
echo "------------------------------"
echo "Setting up Corepack & fnm"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ~/.dotfiles/scripts/cli.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/.dotfiles/scripts/cli.sh

# Create SSH key
echo ""
echo "------------------------------"
echo "Creating SSH key"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ~/.dotfiles/scripts/ssh.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/.dotfiles/scripts/ssh.sh

# Set persistent apps in Dock
echo ""
echo "------------------------------"
echo "Setting persistent applications in Dock"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ~/.dotfiles/scripts/apps.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/.dotfiles/scripts/apps.sh

# Finished
echo "------------------------------"
echo "------------------------------"
echo ""
echo "Completed running .dots! Restarting terminal session. Be sure to also restart when possible."
echo ""
echo "------------------------------"
echo "------------------------------"

# Restart terminal session
echo "------------------------------"
echo ""
exec $SHELL
