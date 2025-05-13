{config,pkgs,lib,flake,...}: {
  options.${flake.config.me.namespace}.gui.terminal.ghostty.enable = lib.mkEnableOption "ghostty";
  config = lib.mkIf config.${flake.config.me.namespace}.gui.terminal.ghostty.enable {
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
};
}
