{ self, pkgs, config, lib, ... }:

{
  system.stateVersion = 6;

  imports = [
    ./homebrew.nix 
    ./system.nix  #macos-settings
    ./packages.nix
  ];
}
