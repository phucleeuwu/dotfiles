{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.bun
          pkgs.zsh
          pkgs.zsh-nix-shell
          pkgs.gh
          pkgs.neovim
          pkgs.ripgrep
          pkgs.tmux
          pkgs.zoxide
          pkgs.yazi
          pkgs.fd
          pkgs.delta
          pkgs.starship
          pkgs.topgrade
          pkgs.aerospace
          pkgs.lazygit
          pkgs.zinit
          pkgs.oh-my-posh
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      programs.zsh.enable = true;   
      security.pam.services.sudo_local.touchIdAuth = true;

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        dock.static-only = true;
        dock.tilesize = 40;
        dock.autohide-delay = 0.0;
        dock.autohide-time-modifier = 0.0;
        dock.largesize = 80;
        dock.showhidden = true;
        dock.show-recents = false;
        finder.AppleShowAllExtensions = true;
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
      };

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#phucs-MacBook-Air
    darwinConfigurations."phucs-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        configuration 
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.phuclee = import ./home.nix;
        }
      ];
    };
  };
}
