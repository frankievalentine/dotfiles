#!/bin/sh

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
chmod +x ~/dotfiles/scripts/mac.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/dotfiles/scripts/mac.sh && brew bundle

# Restart terminal session
echo "------------------------------"
echo ""
exec -l $SHELL

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
chmod +x ~/dotfiles/scripts/cli.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/dotfiles/scripts/cli.sh

# Restart terminal session
echo "------------------------------"
echo ""
exec -l $SHELL

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
chmod +x ~/dotfiles/scripts/ssh.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/dotfiles/scripts/ssh.sh

# Restart terminal session
echo "------------------------------"
echo ""
exec -l $SHELL

# Download Google Fonts
echo ""
echo "------------------------------"
echo "Downloading Google Fonts"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ~/dotfiles/scripts/fonts.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/dotfiles/scripts/fonts.sh

# Restart terminal session
echo "------------------------------"
echo ""
exec -l $SHELL

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
chmod +x ~/dotfiles/scripts/apps.sh
echo ""
echo "------------------------------"
echo "Executing"
echo ""
sh ~/dotfiles/scripts/apps.sh

# Restart terminal session
echo "------------------------------"
echo ""
exec -l $SHELL

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
exec -l $SHELL
