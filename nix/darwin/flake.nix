{
  description = "phuclee's macOS + Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin = { url = "github:LnL7/nix-darwin/master"; inputs.nixpkgs.follows = "nixpkgs"; };
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    # lazyvim = { url = "github:matadaniel/LazyVim-module"; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = { self, nix-darwin, home-manager, nix-homebrew, catppuccin, ... }:
  let
    system = "aarch64-darwin";
    username = "phuc"; #change to your username `whoami`
    hostname = "phuclees-Mac-mini"; #change to your hostname `scutil --get LocalHostName`

    configuration = _: {

      users.users.${username} = {
        home = "/Users/${username}";
        name = "${username}";
      };

      nixpkgs.config.allowUnfree = true;
      nixpkgs.hostPlatform = "${system}";
      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        ./default.nix
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            user = "${username}";
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager {
          home-manager = {
            backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${username} = {
              imports = [
                ./home.nix
                catppuccin.homeManagerModules.catppuccin
              ];
            };
          };
        }
        # stylix.darwinModules.stylix ./stylix.nix
      ];
    };
    darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
  };
}
