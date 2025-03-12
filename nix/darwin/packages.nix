{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.arc-browser
    pkgs.raycast
    pkgs.iina
  ];
}
