{
  config,
  lib,
  pkgs,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.cli.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
    xero.enable = lib.mkEnableOption "xero.fastfetch";
    lierb.enable = lib.mkEnableOption "lierb.fastfetch";
    hyde.enable = lib.mkEnableOption "hyde.fastfetch";
  };
  config.${flake.config.me.namespace}.cli.fastfetch.enable = lib.mkDefault (
    config.${flake.config.me.namespace}.cli.fastfetch.xero.enable
    || config.${flake.config.me.namespace}.cli.fastfetch.lierb.enable
    || config.${flake.config.me.namespace}.cli.fastfetch.hyde.enable
  );
}
