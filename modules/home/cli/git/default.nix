{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.cli.git = {
    enable = lib.mkEnableOption "git";
    delta.enable = lib.mkEnableOption "delta";
  };
}
