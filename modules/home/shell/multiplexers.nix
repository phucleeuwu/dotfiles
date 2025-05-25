_: {
  programs = {
    tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    tmuxinator.enable = true;
    keyMode = "vi";
  };
  zellij = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true;
    settings = {
      show_startup_tips = false;
    };
  };
};
}
