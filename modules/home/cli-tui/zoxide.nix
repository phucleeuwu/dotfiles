_: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
