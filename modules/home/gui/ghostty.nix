_: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true;
    settings = {
      font-family = "Maple Mono NF";
      font-size = 19;
      mouse-hide-while-typing = true;
      macos-option-as-alt = "left";
      background-opacity = 0.9;
      background-blur-radius = 20;
      window-decoration = false;
    };
  };
}
