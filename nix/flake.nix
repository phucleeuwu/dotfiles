{
  description = "phuclee's macOS & NixOS + Home Manager configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-homebrew,
    catppuccin,
    ...
  }: let
    system = {
      linux = "x86_64-linux";
      darwin = "aarch64-darwin";
    };
    user = {
      darwin = "phuc";
      linux = "phuc";
    };
    host = {
      linux = "phuclees-Mac-mini";
      darwin = "Mac-mini-cua-phuclee"; #(`scutil --get LocalHostName`)
    };
    # --- Configuration For All System ---
    configuration = {
      home-manager = {
        backupFileExtension = "backup";
        useUserPackages = true;
        useGlobalPkgs = true;
      };
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nixpkgs.config.allowUnfree = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
    };
  in {
    # --- NixOS Configuration ---
    nixosConfigurations."${host.linux}" = nixpkgs.lib.nixosSystem {
      system = system.linux;
      modules = [
        configuration
        ./nixos/configuration.nix
        {
          users.users.${user.linux} = {
            home = "/home/${user.linux}";
            isNormalUser = true;
            extraGroups = ["wheel"]; # Give sudo access
          };
        }
        home-manager.nixosModules.home-manager
        {
          home-manager.users.${user.linux} = {
            import = [
              ./nixos/home.nix
            ];
          };
        }
        catppuccin.nixosModules.catppuccin
      ];
    };
    # --- macOS Configuration ---
    darwinConfigurations."${host.darwin}" = nix-darwin.lib.darwinSystem {
      system = system.darwin;
      modules = [
        configuration
        ./darwin/configuration.nix
        {
          users.users.${user.darwin} = {
            home = "/Users/${user.darwin}";
            name = "${user.darwin}";
          };
        }
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "${user.darwin}";
            autoMigrate = true;
          };
        }
        home-manager.darwinModules.home-manager
        {
          home-manager.users.${user.darwin} = {
            imports = [
              ./darwin/home.nix
              catppuccin.homeManagerModules.catppuccin
              # stylix.homeManagerModules.stylix
              # ./darwin/stylix.nix
            ];
          };
        }
      ];
    };
    # --- Expose Packages ---
    nixosPackages = self.nixosConfigurations.${host.linux}.pkgs;
    darwinPackages = self.darwinConfigurations.${host.darwin}.pkgs;
  };
}
