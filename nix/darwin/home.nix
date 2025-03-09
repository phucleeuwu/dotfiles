{ config, pkgs, lib, inputs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Don't change unless necessary.

  # home.username = "phuc"; # Ensure this matches your username.
  # home.homeDirectory = "/Users/phuc"; # Ensure this matches your homeDirectory.
  xdg.enable = true;

  imports = [
    ../home/default.nix
    # inputs.LazyVim.homeManagerModules.default
  ];

  # enable or disable programs
  starship.enable = false;
  oh-my-posh.enable = true;

  aerospace.enable = true;
  fish.enable = true;
  ghostty.enable = false;

  # programs.lazyvim = {
  #   enable = true;
  # };
}
