{
  config,
  lib,
  flake,
  ...
}: let inherit (flake.config.me) namespace; in {
  options.${namespace}.terminal.tools.tmux = lib.mkEnableOption "tmux";
  options.${namespace}.terminal.tools.zellij = lib.mkEnableOption "zellij";
  config = lib.mkMerge [
    (lib.mkIf config.${namespace}.terminal.tools.tmux {
      programs.tmux = {
        enable = true;
        mouse = true;
        prefix = "C-a";
        tmuxinator.enable = true;
        keyMode = "vi";
      };
    })
    (lib.mkIf config.${namespace}.terminal.tools.zellij {
      programs.zellij = {
        enable = true;
        settings.show_startup_tips = false;
      };
    })
  ];
}
