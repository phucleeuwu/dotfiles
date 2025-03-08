{ config, pkgs, ... }:

{
  imports = [
    ./homebrew.nix 
    ./system.nix  #macos-settings
    ./packages.nix
    ./home.nix
  ];
}
