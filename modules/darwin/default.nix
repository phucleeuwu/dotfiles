# Configuration common to all macOS systems
{flake, ...}: let
  inherit (flake) config inputs;
  inherit (inputs) self;
in {
  imports = [
    {
      users.users.${config.me.username}.home = "/Users/${config.me.username}";
      system.primaryUser = "${config.me.username}";
      home-manager = {
        users.${config.me.username} = {};
        sharedModules = [
          self.homeModules.default
          inputs.catppuccin.homeModules.catppuccin
          inputs.lazyvim.homeManagerModules.lazyvim
          inputs.nix4nvchad.homeManagerModules.default
          inputs.spicetify-nix.homeManagerModules.spicetify
        ];
      };
    }
    self.nixosModules.common
    inputs.nix-homebrew.darwinModules.nix-homebrew
    self.darwinModules.configuration
    self.darwinModules.homebrew
    self.darwinModules.karabiner-elements
  ];
}
