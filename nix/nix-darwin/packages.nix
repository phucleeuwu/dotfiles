{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.chatgpt
    pkgs.raycast
    pkgs.iina
    pkgs.spotify
  ];
}

