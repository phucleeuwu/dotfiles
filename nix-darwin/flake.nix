{
  description = "phuclee";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, ... }:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages =
        [ 
          pkgs.atuin
          pkgs.bun
          pkgs.curl
          pkgs.git
          pkgs.gh
          pkgs.eza
          pkgs.zsh
          pkgs.helix
          pkgs.bat
          pkgs.yazi
          pkgs.ripgrep
          pkgs.fd
          pkgs.fzf
          pkgs.tmux
          pkgs.zoxide
          pkgs.delta
          pkgs.starship
          pkgs.topgrade
          pkgs.lazygit
          pkgs.neovim
          pkgs.zinit
          pkgs.oh-my-posh
          pkgs.coreutils
          pkgs.stow
          pkgs.fastfetch
          pkgs.onefetch
          #apps
          pkgs.aerospace
          pkgs.iina
        ];

      #homebrew
      homebrew = {
        enable = true;
        brews = [
          "zinit"
        ];
        casks = [
          "zed"
          "ayugram"
          "spotify"
          "chatgpt"
          "arc"
          "ghostty"
          "karabiner-elements"
          "raycast"
          "pearcleaner"
          "font-hack-nerd-font"
          "messenger"
        ];
        onActivation.cleanup = "zap";
      };

      nix.configureBuildUsers = true;
      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nixpkgs.hostPlatform = "aarch64-darwin";
      security.pam.services.sudo_local.touchIdAuth = true;
      nixpkgs.config.allowUnfree = true;
      
      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        dock.static-only = true;
        dock.tilesize = 40;
        dock.autohide-delay = 0.0;
        dock.autohide-time-modifier = 0.0;
        dock.magnification = true;
        dock.largesize = 80;
        dock.showhidden = true;
        dock.show-recents = false;
        finder.FXPreferredViewStyle = "clmv";
        finder.ShowStatusBar = true;
        finder.ShowPathbar = true;
        finder.FXRemoveOldTrashItems = true;
        finder.FXDefaultSearchScope = "SCcf";
        finder.CreateDesktop = false;
        finder.NewWindowTarget = "Home";
        trackpad.Clicking = true;
        trackpad.ActuationStrength = 0;
        spaces.spans-displays = false;
        loginwindow.GuestEnabled = false;
        controlcenter.BatteryShowPercentage = true;
        NSGlobalDomain._HIHideMenuBar = true;
        NSGlobalDomain.AppleShowAllFiles = true;
        NSGlobalDomain.AppleShowAllExtensions = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
        NSGlobalDomain.NSAutomaticInlinePredictionEnabled = false;
        NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
        NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
        NSGlobalDomain.InitialKeyRepeat = 15;
        NSGlobalDomain.KeyRepeat = 2;
        NSGlobalDomain."com.apple.sound.beep.volume" = 0.6065307;
        NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;
        NSGlobalDomain."com.apple.swipescrolldirection" = false;
        LaunchServices.LSQuarantine = false;
      };

    };
  in
  {
    # darwin-rebuild switch --flake .
    darwinConfigurations."phuclees-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        configuration 

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "phuc";
          };
        }

        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.phuc = import ./home.nix;
        }
      ];
    };
  };
}

