{ config, pkgs, ... }:

{
  imports = [
    ./homebrew.nix  #homebrew
    ./system.nix  #macos-settings
    ./packages.nix
  ];
}
