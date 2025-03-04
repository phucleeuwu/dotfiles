{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.bun
    pkgs.coreutils
    pkgs.curl
    pkgs.delta
    pkgs.fastfetch
    pkgs.gh
    pkgs.git
    pkgs.nchat
    pkgs.nerd-fonts.hack
    pkgs.nodejs
    pkgs.onefetch
    pkgs.stow
  ];
}
