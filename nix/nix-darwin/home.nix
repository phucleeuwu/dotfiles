{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Don't change unless necessary.

  home.username = "phuc";
  home.homeDirectory = "/Users/phuc";
  xdg.enable = true;

  imports = [
    ../home-manager/packages.nix    # Packages list
    ../home-manager/env.nix         # Session variables
    ../home-manager/default.nix        # Module
  ];

  # enable or disable programs
  fish.enable = true;
  starship.enable = false;
  ghostty.enable = false;
}
