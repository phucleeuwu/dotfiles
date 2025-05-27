{config, lib, flake,...}: {
  options.${flake.config.me.namespace}.WMs.darwin.enable = lib.mkEnableOption "WMs.darwin";
  imports = [
    ./aerospace/default.nix
    ./sketchybar/default.nix
    ./jankyborders/default.nix
  ];
}
