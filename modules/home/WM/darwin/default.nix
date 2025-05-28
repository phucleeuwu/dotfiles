{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.WM.darwin.enable = lib.mkEnableOption "WM.darwin";
  imports = [
    ./aerospace/default.nix
    ./sketchybar/default.nix
    ./jankyborders/default.nix
  ];
}
