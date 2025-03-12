{ config, pkgs, ... }:

{
  home.stateVersion = "25.05"; # Don't change unless necessary.
  xdg.enable = true;

  imports = [
    ../home/default.nix
    # inputs.LazyVim.homeManagerModules.default
  ];

  # system wide catppuccin
  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  # enable or disable programs
  starship.enable = true;
  oh-my-posh.enable = false;

  programs.git.delta.enable = true;
  aerospace.enable = true;
  fish.enable = true;
  ghostty.enable = false;

  # programs.lazyvim = {
  #   enable = true;
  # };
}
