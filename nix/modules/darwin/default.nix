# Configuration common to all macOS systems
{flake, ...}: let
  inherit (flake) config inputs;
  inherit (inputs) self;
in {
  imports = [
    {
      users.users.${config.me.username} = {
        home = "/Users/${config.me.username}";
      };
      home-manager.users.${config.me.username} = {};
      home-manager.sharedModules = [
        self.homeModules.default
        self.homeModules.darwin-only
        inputs.catppuccin.homeModules.catppuccin
        inputs.lazyvim.homeManagerModules.lazyvim
        ./sketchybar/home.nix
      ];
    }
    inputs.nix-homebrew.darwinModules.nix-homebrew
    self.nixosModules.common
    self.darwinModules.system
    self.darwinModules.homebrew
    ./sketchybar/config.nix
    ./aerospace/config.nix
  ];
}
