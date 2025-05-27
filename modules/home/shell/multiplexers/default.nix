_: {
  programs = {
    tmux = {
      enable = false;
      mouse = true;
      prefix = "C-a";
      tmuxinator.enable = true;
      keyMode = "vi";
    };
    zellij = {
      enable = false;
      enableZshIntegration = true;
      enableFishIntegration = true;
      # enableNushellIntegration = true;
      settings = {
        show_startup_tips = false;
      };
    };
  };
}
