{pkgs, ...}: {
  imports = [
    ./windowManager/darwin/default.nix
  ];
  home.packages = with pkgs; [
    raycast
  ];
}
