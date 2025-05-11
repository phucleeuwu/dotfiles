{config, pkgs, lib, flake, ...}: {
  options.${flake.config.me.namespace}.cli.yazi.enable = lib.mkEnableOption "yazi";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.yazi.enable {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";
    initLua = ./init.lua;
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        wrap = "yes";
        max_width = 1500;
        max_height = 1500;
      };
      opener = {
        edit = [
          {
            run = "nvim \"$@\"";
            block = true;
          }
        ];
      };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
      };
    };
    keymap = {
      manager.prepend_keymap = [
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
        }
        {
          on = "F";
          run = "plugin smart-filter";
        }
        {
          on = "h";
          run = "plugin bypass reverse";
        }
        {
          on = "l";
          run = "plugin bypass smart_enter";
        }
      ];
    };
    plugins = with pkgs.yaziPlugins; {
      inherit bypass toggle-pane full-border yatline yatline-catppuccin git smart-enter smart-filter;
    };
  };
};
}
