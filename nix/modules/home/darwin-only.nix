{pkgs, ...}: {
  imports = [
    ./gui/aerospace.nix
    ./gui/jankyborders.nix
  ];
  home.packages = with pkgs; [
    monitorcontrol
    arc-browser
    raycast
  ];
}
