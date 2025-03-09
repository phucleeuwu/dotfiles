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
    # inputs.LazyVim.homeManagerModules.default
  ];

  # enable or disable programs
  starship.enable = true;
  oh-my-posh.enable = false;

  aerospace.enable = true;
  fish.enable = true;
  ghostty.enable = false;

  # programs.lazyvim = {
  #   enable = true;
  # };
}
