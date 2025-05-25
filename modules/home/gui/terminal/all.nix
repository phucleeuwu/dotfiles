{
  config,
  flake,
  ...
}: {
  programs = {
    wezterm = {
    inherit (config.${flake.config.me.namespace}.terminal.wezterm) enable;
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
  kitty = {
    inherit (config.${flake.config.me.namespace}.terminal.kitty) enable;
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
  ghostty = {
    inherit (config.${flake.config.me.namespace}.terminal.ghostty) enable;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true;
    settings = {
      font-family = "Maple Mono NF";
      font-size = 19;
      mouse-hide-while-typing = true;
      macos-option-as-alt = "left";
      window-decoration = false;
    };
  };
};
}
