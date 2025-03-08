{ config, pkgs, ... }:

{
  imports = [
    ./homebrew.nix 
    ./system.nix  #macos-settings
  ];
}
