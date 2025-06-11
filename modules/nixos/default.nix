# Configuration common to all Linux systems
{flake, ...}: let
  inherit (flake) config inputs;
  inherit (inputs) self;
in {
  imports = [
    {
      users.users.${config.me.username}.isNormalUser = true;
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
  ];
}
