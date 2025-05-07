_: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
  };
}
