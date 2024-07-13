#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `full-setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run the start script
echo ""
echo "------------------------------"
echo "Starting setup, including xcode tooling, homebrew, etc."
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./scripts/start.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
sudo ./scripts/start.sh 

 # Run the mac script
echo ""
echo "------------------------------"
echo "Setting up defaults"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./scripts/mac.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./scripts/mac.sh

 # Run the cli script
echo ""
echo "------------------------------"
echo "Setting up Node, yarn, and executing Brewfile"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./scripts/cli.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./scripts/cli.sh && brew bundle

 # Create SSH key
echo ""
echo "------------------------------"
echo "Creating SSH key and copying to Github"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./scripts/ssh.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./scripts/ssh.sh

 # Install ALL Google Web Fonts
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./scripts/gfonts.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./scripts/gfonts.sh

# Finished
echo "------------------------------"
echo "------------------------------"
echo ""
echo "Completed running .dots!!! Restarting terminal session... and restart system to finish setup."
echo ""
echo "------------------------------"
echo "------------------------------"

# Restart terminal session
echo "------------------------------"
echo ""
exec -l $SHELL
