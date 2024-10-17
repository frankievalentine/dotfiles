{
  description = "Darwin system flake - v3frankie";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          pkgs.coreutils
          pkgs.findutils
          pkgs.grep
          pkgs.gnused
          pkgs.openssh
          pkgs.wget
          pkgs.curl
          pkgs.ruby
          pkgs.zsh
          pkgs.zsh-completions
          pkgs.zsh-autosuggestions
          pkgs.zsh-autocomplete
          pkgs.starship
          pkgs.bash
          pkgs.bash-completion
          pkgs.neovim
          pkgs.btop
          pkgs.bottom
          pkgs.lazygit
          pkgs.gdu
          pkgs.git
          pkgs.hub
          pkgs.libpq
          pkgs.gh
          pkgs.fd
          pkgs.ccat
          pkgs.bat
          pkgs.httpstat
          pkgs.zoxide
          pkgs.atuin
          pkgs.mkcert
          pkgs.postgresql_16
          pkgs.mongodb
          pkgs.trashy
          pkgs.mas
          pkgs.navi
          pkgs.tmux
          pkgs.cloudflared
          pkgs.kubernetes-helm
          pkgs.kompose
          pkgs.tart
          pkgs.vagrant
          pkgs.act
          pkgs.fnm
          pkgs.flyctl
          pkgs._1password
          pkgs.deno
          pkgs.bun
          # Start GUI apps available on nix-pkgs unfree
          pkgs.raycast
          pkgs.stats
          pkgs.vscode
          pkgs.warp-terminal
          pkgs.github-desktop
          pkgs.httpie
          pkgs.postman
          pkgs.altair
          pkgs.tailscale
          pkgs.tableplus
          pkgs.mongodb-compass
          pkgs.utm
          pkgs._1password-gui
          pkgs.slack
          pkgs.zoom-us
          pkgs.discord
          pkgs.obsidian
          pkgs.obs-studio
          pkgs.iina
          pkgs.keka
        ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
          "mysql-client"
        ];
        taps = [
          "homebrew/cask"
          "homebrew/cask-versions"
          "buo/cask-upgrade"
        ];
        casks = [
          "google-chrome"
          "brave-browser"
          "arc"
          "cursor"
          "dbngin"
          "transmit"
          "orbstack"
          "figma"
          "framer"
          "spline"
          "rive"
          "hiddenbar"
          "chatgpt"
          "itsycal"
          "notion"
          "reminders-menubar"
          "timemachineeditor"
          "numi"
          "pictogram"
          "nucleo"
          "protonvpn"
          "ledger-live"
          "webull"
          "tradingview"
        ];
        masApps = {
          "Magnet" = 441258766;
          "Klack" = 2143728525;
          "KeyStroke Pro" = 1572206224;
          "Cursor Pro" = 1447043133;
        };
        onActivation.cleanup = "zap";
      };

      fonts.packages = [
        (pkgs.nerdfonts.override { fonts = [
            "JetBrainsMono" 

          ]; 
        })
        pkgs.google-fonts
        pkgs.input-fonts
        pkgs.monaspace
        pkgs.cascadia-code
        pkgs.monoid
        pkgs.geist-font
      ];

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

      system.defaults = {
        dock.autohide  = true;
        dock.largesize = 64;
        dock.persistent-apps = [
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "/Applications/Firefox.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Calendar.app"
        ];
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled  = false;
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mini" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            # Apple Silicon Only
            enableRosetta = true;
            # User owning the Homebrew prefix
            user = "frankie";
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mini".pkgs;
  };
}
