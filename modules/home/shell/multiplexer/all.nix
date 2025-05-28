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
      enableZshIntegration = true;
      enableFishIntegration = true;
      # enableNushellIntegration = true;
      settings = {
        show_startup_tips = false;
      };
    };
  };
}
