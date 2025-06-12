{ config, flake, ... }:
let namespace = flake.config.me.namespace;
in {
  programs = {
    wezterm = {
      inherit (config.${namespace}.terminal.emulators.wezterm) enable;
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
      inherit (config.${namespace}.terminal.emulators.kitty) enable;
      font = {
        name = "Maple Mono";
        size = 19;
      };
      settings = {
        hide_window_decorations = "titlebar-only";
        macos_option_as_alt = "left";
      };
    };
    ghostty = {
      inherit (config.${namespace}.terminal.emulators.ghostty) enable;
      package = null; # Until ghostty is available in darwin
      settings = {
        font-family = "Maple Mono";
        font-size = 19;
        mouse-hide-while-typing = true;
        macos-titlebar-style = "hidden";
        macos-option-as-alt = "left";
      };
    };
  };
}
