{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Don't change unless necessary.

  home.username = "phuc"; # Ensure this matches your username.
  home.homeDirectory = "/Users/phuc"; # Ensure this matches your homeDirectory.
  xdg.enable = true;

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../home-manager/packages.nix    # Packages list
    ../home-manager/env.nix         # Session variables
    ../home-manager/default.nix        # Module
    ../home-manager/aliases.nix       # ShellAliases
  ];

  # enable or disable programs
  fish.enable = true;
  starship.enable = false;
  ghostty.enable = false;
}
