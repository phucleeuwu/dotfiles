{ pkgs, ... }:

{
  home.packages = [
    pkgs.bun
    pkgs.chatgpt
    pkgs.curl
    pkgs.git
    pkgs.nchat
    pkgs.nerd-fonts.hack
    pkgs.nodejs
    pkgs.onefetch
    pkgs.stow
    pkgs.spotify
    pkgs.git-ignore
    pkgs.uutils-coreutils-noprefix
    pkgs.imagemagick
  ];
}
