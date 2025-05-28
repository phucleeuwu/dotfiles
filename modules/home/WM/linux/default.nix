{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.WM.linux.enable = lib.mkEnableOption "WM.linux";
  imports = [
    ./hyprlock/default.nix
  ];
}
