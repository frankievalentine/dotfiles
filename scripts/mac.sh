#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osx.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##############################################################
# General System                                                       
##############################################################
# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "Frankie's MacBook Pro"
sudo scutil --set HostName "Frankie's MacBook Pro"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Frankie's MacBook Pro"

# Disable startup chime
sudo nvram StartupMute=%01

# Set DNS to Cloudflare (Wi-Fi)
networksetup -setdnsservers Wi-Fi 1.1.1.1 1.0.0.1
#networksetup -setdnsservers Ethernet 1.1.1.1 1.0.0.1

##############################################################
# General UI/UX                                                               
##############################################################

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info at the bottom of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Set grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 50" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 50" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 50" ~/Library/Preferences/com.apple.finder.plist

# Set the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 36" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 36" ~/Library/Preferences/com.apple.finder.plist

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -boolean false

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -boolean true


##############################################################
# Finder                                                           
##############################################################

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -boolean true

# Show hidden app icons
defaults write com.apple.dock showhidden -boolean true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -boolean true

# Show status bar
defaults write com.apple.finder ShowStatusBar -boolean true

# Show path bar
defaults write com.apple.finder ShowPathbar -boolean true

# Show the ~/Library folder
chflags nohidden ~/Library

# Allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -boolean true

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -boolean true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -boolean true
defaults write com.apple.finder ShowHardDrivesOnDesktop -boolean true
defaults write com.apple.finder ShowMountedServersOnDesktop -boolean true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -boolean true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -boolean false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -boolean true

# Tweak the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float .5

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -boolean true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -boolean true \
    OpenWith -boolean true \
    Privileges -boolean true


##############################################################
# Dock                                       
##############################################################

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -boolean false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -boolean true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Speed up the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Make Dock icons of hidden applications transparent
defaults write com.apple.dock showhidden -boolean true

##############################################################
# Activity Monitor
##############################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -boolean true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

##############################################################
# Mac App Store                                                            
##############################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -boolean true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -boolean true

##############################################################
# Kill affected applications                                                  
##############################################################

for app in "Activity Monitor" "cfprefsd" \
    "Dock" "Finder" \
    "Safari"; do
    killall "${app}" > /dev/null 2>&1
done

echo ""
echo ""
echo "Done. Note that some of these changes require a logout/restart to take effect."

##############################################################
# Optional                                                
##############################################################

# Set computer name (as done via System Preferences → Sharing)
# sudo scutil --set ComputerName "0x6D746873"
# sudo scutil --set HostName "0x6D746873"
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Set standby delay to 24 hours (default is 1 hour or 3600)
# sudo pmset -a standbydelay 86400

# Enable Time Machine
# sudo tmutil enable

# Enable FileVault
# sudo fdesetup enable

# Set static IP address (Ethernet)
# networksetup -setmanual "Ethernet" 192.168.2.100 255.255.255.0 192.168.2.1

# Set the computer to sleep after 60 minutes
#sudo systemsetup -setcomputersleep 60

# Add a Space to Dock
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

# Add a Small Space to Dock
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'


##############################################################
# Reset                                                  
##############################################################

# Enable startup chime
# sudo nvram StartupMute=%00

# RESET DOCK TO DEFAULT
# defaults delete com.apple.dock && \
# killall Dock
