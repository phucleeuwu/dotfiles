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

  outputs = { self, nixpkgs, nix-darwin, home-manager, nix-homebrew, catppuccin, ... }:
  let
    linux = "x86_64-linux";
    darwin = "aarch64-darwin";
    user-linux = "phuc";
    user-darwin = "phuc";
    host-linux = "phuclees-Mac-mini";
    host-darwin = "phuclees-Mac-mini"; # Change to your hostname (`scutil --get LocalHostName`)

    configuration = {
      home-manager = {
        backupFileExtension = "backup";
        useGlobalPkgs = true;
        useUserPackages = true;
      };

      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
      system.configurationRevision = self.rev or self.dirtyRev or null;
      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    # --- NixOS Configuration ---
    nixosConfigurations."${host-linux}" = nixpkgs.lib.nixosSystem {
      system = linux;
      modules = [
        configuration
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.users.${user-linux} = {
            import = [
              ./nixos/home.nix
            ];
          };
        }
        catppuccin.nixosModules.catppuccin
        {
          users.users.${user-linux} = {
            home = "/home/${user-linux}";
            isNormalUser = true;
            extraGroups = [ "wheel" ]; # Give sudo access
          };
        }
      ];
    };

    # --- macOS Configuration ---
    darwinConfigurations."${host-darwin}" = nix-darwin.lib.darwinSystem {
      system = darwin;
      modules = [
        configuration
        ./darwin/configuration.nix
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            user = "${user-darwin}";
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager {
          home-manager.users.${user-darwin} = {
            imports = [
              ./darwin/home.nix
              catppuccin.homeManagerModules.catppuccin
            ];
          };
        }
        {
          users.users.${user-darwin} = {
            home = "/Users/${user-darwin}";
            name = "${user-darwin}";
          };
        }
        # stylix.darwinModules.stylix ./stylix.nix
      ];
    };

    # --- Expose Packages ---
    nixosPackages = self.nixosConfigurations.${host-linux}.pkgs;
    darwinPackages = self.darwinConfigurations.${host-darwin}.pkgs;
  };
}
