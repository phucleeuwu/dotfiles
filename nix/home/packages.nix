{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
    pkgs.bun
    pkgs.chatgpt
    pkgs.coreutils
    pkgs.curl
    pkgs.delta
    pkgs.git
    pkgs.nchat
    pkgs.nerd-fonts.hack
    pkgs.nodejs
    pkgs.onefetch
    pkgs.stow
    pkgs.spotify
  ];
}
