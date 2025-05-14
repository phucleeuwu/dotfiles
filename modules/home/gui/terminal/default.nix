{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.terminal = {
    wezterm.enable = lib.mkEnableOption "terminal.wezterm";
    kitty.enable = lib.mkEnableOption "terminal.kitty";
    ghostty.enable = lib.mkEnableOption "terminal.ghostty";
  };
}
