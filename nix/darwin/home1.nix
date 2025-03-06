{ config, pkgs, lib, inputs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Don't change unless necessary.

  # home.username = "phuc"; # Ensure this matches your username.
  # home.homeDirectory = "/Users/phuc"; # Ensure this matches your homeDirectory.
  xdg.enable = true;

  imports = [
    ../home-manager/packages.nix    # Packages list
    ../home-manager/env.nix         # Session variables
    ../home-manager/default.nix        # Module
    ../home-manager/aliases.nix       # ShellAliases
  ];

  # enable or disable programs
  aerospace.enable = true;
  fish.enable = true;
  starship.enable = false;
  ghostty.enable = false;

}
