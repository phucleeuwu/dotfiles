{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.gui.terminal.wezterm.enable = lib.mkEnableOption "terminal.wezterm";
  config = lib.mkIf config.${flake.config.me.namespace}.gui.terminal.wezterm.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      # enableFishIntegration = true;
      # enableNushellIntegration = true;
      extraConfig = ''
        local wezterm = require 'wezterm'
        local config = {
          font = wezterm.font 'Maple Mono NF',
          font_size = 19,
          window_decorations = "RESIZE",
          enable_tab_bar = false,
          window_close_confirmation = 'NeverPrompt',
        }
        return config
      '';
    };
  };
}
