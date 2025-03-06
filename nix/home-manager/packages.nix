{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.arc-browser
    pkgs.neovim
    pkgs.raycast
    pkgs.iina
    pkgs.bun
    pkgs.chatgpt
    pkgs.coreutils
    pkgs.curl
    pkgs.delta
    pkgs.gh
    pkgs.git
    pkgs.nchat
    pkgs.nerd-fonts.hack
    pkgs.nodejs
    pkgs.onefetch
    pkgs.stow
    pkgs.spotify
    pkgs.zed-editor
  ];
}
