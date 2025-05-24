{pkgs, ...}: {
  imports = [
    ./WMs/darwin/default.nix
  ];
  home.packages = with pkgs; [
    raycast
  ];
}
