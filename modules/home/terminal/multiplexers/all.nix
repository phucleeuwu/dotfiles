{
  config,
  flake,
  ...
}: {
  programs = {
    tmux = {
      inherit (config.${flake.config.me.namespace}.terminal.multiplexers.tmux) enable;
      mouse = true;
      prefix = "C-a";
      tmuxinator.enable = true;
      keyMode = "vi";
    };
    zellij = {
      inherit (config.${flake.config.me.namespace}.terminal.multiplexers.zellij) enable;
      settings = {
        show_startup_tips = false;
      };
    };
  };
}
