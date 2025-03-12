{
  description = "phuclee's macOS & NixOS + Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin = { url = "github:LnL7/nix-darwin/master"; inputs.nixpkgs.follows = "nixpkgs"; };
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    # lazyvim = { url = "github:matadaniel/LazyVim-module"; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, catppuccin, ... }@inputs:
  let
    sys-linux = "x86_64-linux";
    sys-darwin = "aarch64-darwin";
    user-linux = "phuc";
    user-darwin = "phuc";
    host-linux = "phuclees-Mac-mini";
    host-darwin = "phuclees-Mac-mini"; # Change to your hostname (`scutil --get LocalHostName`)
  in
  {
    # --- NixOS Configuration ---
    nixosConfigurations."${host-linux}" = nixpkgs.lib.nixosSystem {
      system = sys-linux;
      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user-linux} = import ./nixos/home.nix;
        }
        catppuccin.nixosModules.catppuccin
      ];
    };

    # --- macOS Configuration ---
    darwinConfigurations."${host-darwin}" = nix-darwin.lib.darwinSystem {
      system = sys-darwin;
      modules = [
        ./darwin/configuration.nix
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            user = "${user-darwin}";
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user-darwin} = {
            imports = [
              ./darwin/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
      ];
    };

    # --- Expose Packages ---
    nixosPackages = self.nixosConfigurations.${host-linux}.pkgs;
    darwinPackages = self.darwinConfigurations.${host-darwin}.pkgs;
  };
}
