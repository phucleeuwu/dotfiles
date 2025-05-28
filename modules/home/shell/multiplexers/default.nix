{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.shells.multiplexers = {
    tmux.enable = lib.mkEnableOption "shells.multiplexers.tmux";
    zellij.enable = lib.mkEnableOption "shells.multiplexers.zellij";
  };
}
