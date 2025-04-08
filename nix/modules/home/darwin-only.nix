{pkgs, ...}: {
  imports = [
    ./gui/aerospace.nix
    ./services/jankyborders.nix
  ];
  home.packages = with pkgs; [
    monitorcontrol
    arc-browser
    raycast
  ];
}
