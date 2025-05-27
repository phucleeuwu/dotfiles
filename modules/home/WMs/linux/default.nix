{config, lib,flake,...}: {
  options.${flake.config.me.namespace}.WMs.linux.enable = lib.mkEnableOption "WMs.linux";
  imports = [
    ./hyprlock/default.nix
  ];
}
