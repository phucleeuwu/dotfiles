{
  config,
  flake,
  ...
}: {
  programs = {
    wezterm = {
      inherit (config.${flake.config.me.namespace}.terminal.wezterm) enable;
      extraConfig = ''
        local wezterm = require 'wezterm'
        local config = {
          font = wezterm.font 'Maple Mono',
          font_size = 19,
          window_decorations = "RESIZE",
          enable_tab_bar = false,
          window_close_confirmation = 'NeverPrompt',
        }
        return config
      '';
    };
    kitty = {
      inherit (config.${flake.config.me.namespace}.terminal.kitty) enable;
      font = {
        name = "Maple Mono";
        size = 19;
      };
      settings = {
        hide_window_decorations = true;
        macos_option_as_alt = "left";
      };
    };
    ghostty = {
      inherit (config.${flake.config.me.namespace}.terminal.ghostty) enable;
      package = null; # Until ghostty is available in darwin
      settings = {
        font-family = "Maple Mono";
        font-size = 19;
        window-decoration = false;
        mouse-hide-while-typing = true;
        macos-option-as-alt = "left";
      };
    };
  };
}
