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

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
  let
    system = "aarch64-darwin"; # Ensure this matches your system
    username = "phuc"; #change to your username
    hostname = "phuclees-MacBook-Air"; #change to your hostname
    configuration = { pkgs, ... }: {

      # environment.systemPackages = [
      #     pkgs.home-manager
      # ];

      users.users.${username} = {
        home = "/Users/${username}";
        name = "${username}";
      };

      nix.settings.experimental-features = "nix-command flakes";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 6;
      nixpkgs.hostPlatform = "${system}";
      security.pam.services.sudo_local.touchIdAuth = true;
      nixpkgs.config.allowUnfree = true;
    };
  in
  {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        ./darwin/default.nix
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
          home-manager.users.${username} = import ./home/home.nix;
        }
      ];
    };

    darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
  };
}
