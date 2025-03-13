{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.karabiner-elements
    pkgs.arc-browser
    pkgs.raycast
    pkgs.iina
  ];
}
