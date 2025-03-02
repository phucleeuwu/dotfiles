{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.raycast
    pkgs.iina
    pkgs.spotify
    pkgs.aerospace
  ];
}

