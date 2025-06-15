{
  config,
  lib,
  flake,
  ...
}: let
  inherit (flake.config.me) namespace;
in {
  options.${namespace}.terminal.multiplexers = {
    tmux.enable = lib.mkEnableOption "tmux";
    zellij.enable = lib.mkEnableOption "zellij";
  };
  config = lib.mkMerge [
    (lib.mkIf config.${namespace}.terminal.multiplexers.tmux.enable {
      programs.tmux = {
        enable = true;
        mouse = true;
        prefix = "C-a";
        tmuxinator.enable = true;
        keyMode = "vi";
      };
    })
    (lib.mkIf config.${namespace}.terminal.multiplexers.zellij.enable {
      programs.zellij = {
        enable = true;
        settings.show_startup_tips = false;
      };
    })
  ];
}
