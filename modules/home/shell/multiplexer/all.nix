{
  config,
  flake,
  ...
}: {
  programs = {
    tmux = {
      inherit (config.${flake.config.me.namespace}.shell.multiplexer.tmux) enable;
      mouse = true;
      prefix = "C-a";
      tmuxinator.enable = true;
      keyMode = "vi";
    };
    zellij = {
      inherit (config.${flake.config.me.namespace}.shell.multiplexer.zellij) enable;
      settings = {
        show_startup_tips = false;
      };
    };
  };
}
