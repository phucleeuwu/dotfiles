{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.terminal.multiplexers = {
    tmux.enable = lib.mkEnableOption "tmux";
    zellij.enable = lib.mkEnableOption "zellij";
  };
}
