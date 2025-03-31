_: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true; # Uncomment if needed
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
  };
}
