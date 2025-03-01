{ config, pkgs, ... }:
{
  home.username = "phuc";
  home.homeDirectory = "/Users/phuc";

  home.stateVersion = "24.11"; # Don't change unless necessary.

  imports = [
    ./packages.nix    # Packages list
    ./dotfiles.nix    # Dotfile management
    ./env.nix         # Session variables
    ./zsh.nix
    ./bat.nix
    ./git.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
