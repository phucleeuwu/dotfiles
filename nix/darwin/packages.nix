{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.arc-browser
    pkgs.raycast
    pkgs.iina
    pkgs.zed-editor
    pkgs.ayugram-desktop
  ];
}
