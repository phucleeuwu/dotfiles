_: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
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
      cursor_trail = 3;
    };
  };
}
