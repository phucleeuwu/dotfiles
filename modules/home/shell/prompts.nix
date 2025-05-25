_: {
  programs = {
    starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableTransience = true;
    settings = {
      character = {
        success_symbol = "[[󰄛](green) ❯](peach)";
        error_symbol = "[[󰄛](red) ❯](peach)";
        vimcmd_symbol = "[󰄛 ❮](subtext1)";
      };
      git_branch = {
        style = "bold mauve";
      };
      directory = {
        truncation_length = 4;
        style = "bold lavender";
      };
      git_metrics = {
        disabled = false;
      };
    };
  };
  oh-my-posh = {
    enable = false;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    useTheme = "pure";
  };
  };
}
