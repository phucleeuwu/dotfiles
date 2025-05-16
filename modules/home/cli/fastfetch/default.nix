{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.cli.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
    jakoolit.enable = lib.mkEnableOption "jakoolit.fastfetch";
    hyde.enable = lib.mkEnableOption "hyde.fastfetch";
    ml4w.enable = lib.mkEnableOption "ml4w.fastfetch";
  };
  config.${flake.config.me.namespace}.cli.fastfetch.enable = lib.mkDefault (
    config.${flake.config.me.namespace}.cli.fastfetch.jakoolit.enable
    || config.${flake.config.me.namespace}.cli.fastfetch.hyde.enable
    || config.${flake.config.me.namespace}.cli.fastfetch.ml4w.enable
  );
}
