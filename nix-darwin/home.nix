{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "24.11"; # Don't change unless necessary.

  # home.username = "phuc";
  # home.homeDirectory = "/Users/phuc";
  xdg.enable = true;


  imports = [
    ./home-manager/packages.nix    # Packages list
    ./home-manager/dotfiles.nix    # Dotfile management
    ./home-manager/env.nix         # Session variables
  ];

  programs = {
    zsh = import ../home/zsh.nix {inherit config pkgs;};
    fish = import ../home/fish.nix {inherit config pkgs;};
    nushell = import ../home/nushell.nix {inherit config pkgs;};
    bat = import ../home/bat.nix {inherit config pkgs;};
    git = import ../home/git.nix {inherit config pkgs;};
    zoxide = import ../home/zoxide.nix {inherit config pkgs;};
    atuin = import ../home/atuin.nix {inherit config pkgs;};
    oh-my-posh = import ../home/oh-my-posh.nix {inherit config pkgs;};
    starship = import ../home/starship.nix {inherit config pkgs;};
  };
}
