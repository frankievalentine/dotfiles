# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew "coreutils"

# Install some other useful utilities like `sponge`.
brew "moreutils"
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew "findutils"
# Install GNU `sed`, overwriting the built-in `sed`.
brew "gnu-sed"

# Add to PATH to use normal grep commands 
# PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
brew "grep"
brew "openssh"

# Install other necessary binaries.
brew "wget"
brew "ruby"
brew "zsh"
brew "bash"
brew "bash-completion"
brew "git"
brew "hub"
brew "gh"
brew "ccat"
brew "exa"
brew "bat"
brew "cloudflared"
brew "mkcert"
brew "trash"
brew "mas"
brew "flyctl"
brew "colima"
brew "fauna-shell"
brew "doctl"
brew "awscli"
brew "navi"
brew "deno"
brew "mysql-client"

# Tap the cask
tap "homebrew/cask"

# Core casks
cask "alfred"
cask "raycast"
cask "iterm2"
cask "visual-studio-code"
cask "stats"
cask "docker"

## Firefox Developer Edition
tap "homebrew/cask-versions"
cask "firefox-developer-edition"

# Development tool casks
cask "tableplus"
cask "github"
cask "postman"
cask "postman-cli"
cask "altair-graphql-client"
cask "transmit"
cask "fing-cli"
cask "multipass"
cask "tailscale"

# Design casks
cask "figma"
cask "framer"
cask "iconset"

# Fonts
# To search: brew search "/font-/"
tap "homebrew/cask-fonts"
brew "font-inter"
brew "font-rubik"
brew "font-damion"
brew "font-raleway"
brew "font-montserrat"
brew "font-input"
brew "font-gilbert"
brew "font-lato"
brew "font-roboto"
brew "font-roboto-mono"
brew "font-cascadia-code"
brew "font-ibm-plex-mono"
brew "font-monoid"
brew "font-qwigley"
brew "font-hasklig"
brew "font-covered-by-your-grace"
brew "font-league-gothic"
brew "font-rambla"
brew "font-share-tech"
brew "font-3270-nerd-font"
brew "font-fira-mono-nerd-font"
brew "font-inconsolata-go-nerd-font"
brew "font-inconsolata-lgc-nerd-font"
brew "font-inconsolata-nerd-font"
brew "font-monofur-nerd-font"
brew "font-overpass-nerd-font"
brew "font-ubuntu-mono-nerd-font"
brew "font-agave-nerd-font"
brew "font-arimo-nerd-font"
brew "font-anonymice-nerd-font"
brew "font-aurulent-sans-mono-nerd-font"
brew "font-bigblue-terminal-nerd-font"
brew "font-bitstream-vera-sans-mono-nerd-font"
brew "font-blex-mono-nerd-font"
brew "font-caskaydia-cove-nerd-font"
brew "font-code-new-roman-nerd-font"
brew "font-cousine-nerd-font"
brew "font-daddy-time-mono-nerd-font"
brew "font-dejavu-sans-mono-nerd-font"
brew "font-droid-sans-mono-nerd-font"
brew "font-fantasque-sans-mono-nerd-font"
brew "font-fira-code-nerd-font"
brew "font-go-mono-nerd-font"
brew "font-gohufont-nerd-font"
brew "font-hack-nerd-font"
brew "font-hasklug-nerd-font"
brew "font-heavy-data-nerd-font"
brew "font-hurmit-nerd-font"
brew "font-im-writing-nerd-font"
brew "font-iosevka-nerd-font"
brew "font-jetbrains-mono-nerd-font"
brew "font-lekton-nerd-font"
brew "font-liberation-nerd-font"
brew "font-meslo-lg-nerd-font"
brew "font-monoid-nerd-font"
brew "font-mononoki-nerd-font"
brew "font-mplus-nerd-font"
brew "font-noto-nerd-font"
brew "font-open-dyslexic-nerd-font"
brew "font-profont-nerd-font"
brew "font-proggy-clean-tt-nerd-font"
brew "font-roboto-mono-nerd-font"
brew "font-sauce-code-pro-nerd-font"
brew "font-shure-tech-mono-nerd-font"
brew "font-space-mono-nerd-font"
brew "font-terminess-ttf-nerd-font"
brew "font-tinos-nerd-font"
brew "font-ubuntu-nerd-font"
brew "font-victor-mono-nerd-font"

# Misc casks
#cask "google-chrome"
cask "1password"
# 1password-cli Requires password
cask "1password-cli"
# cask "rectangle"
cask "hiddenbar"
cask "notion"
cask "appcleaner"
cask "imageoptim"
cask "spotify"
cask "slack"
cask "zoom"
cask "discord"
cask "obsidian"
cask "keka"
cask "timemachineeditor"
cask "fantastical"
cask "numi"
# cask "keycastr"
cask "alt-tab"
cask "monitorcontrol"
cask "pictogram"
cask "protonvpn"
cask "tradingview"
cask "todoist"
cask "signal"
cask "telegram"

# Install Mac App Store apps (listed under your purchased apps in the App Store)
# Search using 'mas search "APP NAME"'
# mas "Slack", id: 803453959
mas "Magnet", id: 441258766
mas "Hi Sticky: Notes SE + Widget", id: 1610634186
mas "Klack", id: 2143728525
mas "KeyStroke Pro", id: 1572206224
mas "Parcel - Delivery Tracking", id: 639968404



# Example Brewfile for reference
# 'brew tap'
#tap "homebrew/cask"
# 'brew tap' with custom Git URL
#tap "user/tap-repo", "https://user@bitbucket.org/user/homebrew-tap-repo.git"
# 'brew tap' with arguments
#tap "user/tap-repo", "https://user@bitbucket.org/user/homebrew-tap-repo.git", force_auto_update: true

# set arguments for all 'brew install --cask' commands
#cask_args appdir: "~/Applications", require_sha: true

# 'brew install'
#brew "imagemagick"
# 'brew install --with-rmtp', 'brew services restart' on version changes
#brew "denji/nginx/nginx-full", args: ["with-rmtp"], restart_service: :changed
# 'brew install', always 'brew services restart', 'brew link', 'brew unlink mysql' (if it is installed)
#brew "mysql@5.6", restart_service: true, link: true, conflicts_with: ["mysql"]
# install only on specified OS
#brew "gnupg" if OS.mac?
#brew "glibc" if OS.linux?

# 'brew install --cask'
#cask "google-chrome"
# 'brew install --cask --appdir=~/my-apps/Applications'
#cask "firefox", args: { appdir: "~/my-apps/Applications" }
# bypass Gatekeeper protections (NOT RECOMMENDED)
#cask "firefox", args: { no_quarantine: true }
# always upgrade auto-updated or unversioned cask to latest version even if already installed
#cask "opera", greedy: true
# 'brew install --cask' only if '/usr/libexec/java_home --failfast' fails
#cask "java" unless system "/usr/libexec/java_home --failfast"

# 'mas install'
#mas "1Password", id: 443987910

# 'whalebrew install'
#whalebrew "whalebrew/wget"