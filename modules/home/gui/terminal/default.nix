{config,pkgs,lib,flake,...}:{
  options.${flake.config.me.namespace}.terminal = {
    wezterm.enable = lib.mkEnableOption "terminal.wezterm";
    ghostty.enable = lib.mkEnableOption "terminal.ghostty";
    kitty.enable = lib.mkEnableOption "terminal.kitty";
  };
  imports = [./all.nix];
}
