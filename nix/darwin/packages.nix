{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.arc-browser
    pkgs.zed-editor
    pkgs.raycast
    pkgs.iina
    pkgs.upscayl
    pkgs.git-ignore
  ];
}
