{pkgs, ...}: {
  imports = [
    ./gui/aerospace.nix
  ];
  home.packages = with pkgs; [
    monitorcontrol
    arc-browser
    raycast
  ];
}
