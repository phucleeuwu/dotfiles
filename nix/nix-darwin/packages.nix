{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.chatgpt
    pkgs.raycast
    pkgs.iina
    pkgs.spotify
  ];
}

