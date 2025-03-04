{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.aerospace
    pkgs.chatgpt
    pkgs.raycast
    pkgs.iina
    pkgs.spotify
  ];
}

