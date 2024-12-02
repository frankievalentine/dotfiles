for dockItem in {/System/Applications/{"Mail","Notes","System Preferences","App Store","Preview"},/Applications/{"iTerm","Visual Studio Code","Brave Browser"}}.app; do
  defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>'$dockItem'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
done
