{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  environment.systemPackages = [
    pkgs.raycast
    pkgs.iina
    pkgs.spotify
    pkgs.aerospace
  ];
}

