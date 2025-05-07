_: {
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    git = true;
    icons = "auto";
    colors = "auto";
    extraOptions = ["--group-directories-first"];
  };
}
