{ self, pkgs, config, lib, ... }:

{
  users.users.phuc = {
    home = "/Users/phuc";
    name = "phuc";
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;

  imports = [
    ./homebrew.nix 
    ./system.nix  #macos-settings
    ./packages.nix
  ];
}
