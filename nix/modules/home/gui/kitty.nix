_: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      mode = "no-cursor";
      enableZshIntegration = true;
      enableFishIntegration = true;
      # enableNushellIntegration = true;
    };
    font = {
      name = "Maple Mono NF";
      size = 19;
    };
    settings = {
      hide_window_decorations = true;
      macos_option_as_alt = "left";
    };
  };
}
