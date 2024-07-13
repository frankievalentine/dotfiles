#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `full-setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run the start script
echo ""
echo "------------------------------"
echo "Starting setup, including xcode tooling, homebrew, and Brewfile"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./start.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
sudo ./start.sh && brew bundle

 # Run the cli script
echo ""
echo "------------------------------"
echo "Setting up CLI's"
echo "------------------------------"
echo ""
echo "------------------------------"
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./cli.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./cli.sh

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
chmod +x ./mac.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./mac.sh

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
chmod +x ./ssh.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./ssh.sh

 # Install Google ALL Web Fonts
echo "Making sure script is executable"
echo "------------------------------"
echo ""
chmod +x ./ssh.sh
echo ""
echo "------------------------------"
echo "Executing"
echo "------------------------------"
echo ""
./ssh.sh

echo "------------------------------"
echo "------------------------------"
echo ""
echo "Completed running .dots!!! Restart your computer to ensure all updates take effect"
echo ""
echo "------------------------------"
echo "------------------------------"

# Restart terminal session
echo "------------------------------"
echo "Restarting terminal session."
exec -l $SHELL