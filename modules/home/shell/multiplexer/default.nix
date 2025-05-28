{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.shell.multiplexer = {
    tmux.enable = lib.mkEnableOption "shell.multiplexer.tmux";
    zellij.enable = lib.mkEnableOption "shell.multiplexer.zellij";
  };
}
