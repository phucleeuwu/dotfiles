{ config, pkgs, ... }:

{
  home.username = "phuc";
  home.homeDirectory = "/Users/phuc";

  home.packages = [
    pkgs.neovim
    pkgs.git
  ];

  programs.bash.enable = true;

  home.stateVersion = "23.11";
}
