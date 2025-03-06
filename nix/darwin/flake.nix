{
  description = "phuclee's macOS + Home Manager configuration";

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
    system = "aarch64-darwin"; # Ensure this matches your system
    username = "phuc"; #change to your username `whoami`
    hostname = "ANHDUNGs-Mac-mini"; #change to your hostname `scutil --get LocalHostName`

    configuration = { config, pkgs, lib, ... }: {

      users.users.${username} = {
        home = "/Users/${username}";
        name = "${username}";
      };

      home-manager.backupFileExtension = "backup";
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nixpkgs.hostPlatform = "${system}";
      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        ./.
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            user = "${username}";
            autoMigrate = true;
          };
        }

        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = import ./home.nix;
        }
      ];
    };
    darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
  };
}
