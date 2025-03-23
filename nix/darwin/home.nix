{pkgs, ...}: {
  imports = [
    ../home.nix
  ];
  # macOS-only packages
  home.packages = [
    pkgs.arc-browser
    pkgs.raycast
    pkgs.iina
    pkgs.monitorcontrol
  ];
  aerospace.enable = true;
}
