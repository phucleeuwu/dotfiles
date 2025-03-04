{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.arc-browser
    pkgs.chatgpt
    pkgs.raycast
    pkgs.iina
    pkgs.spotify
  ];
}

