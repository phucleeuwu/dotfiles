{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.yazi.enable = lib.mkEnableOption "yazi";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      shellWrapperName = "y";
      initLua = ./init.lua;
      # initLua = ''
      #   require("full-border"):setup()
      #   require("git"):setup()
      #   require("yatline").setup(0,{theme=require("yatline-catppuccin").setup("mocha")})
      # '';
      settings = {
        mgr.show_hidden = true;
        preview = {
          wrap = "yes";
          max_width = 1500;
          max_height = 1500;
        };
        opener.edit = [
          {
            run = "nvim \"$@\"";
            block = true;
          }
        ];
        plugin.prepend_fetchers = [
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
      keymap = {
        mgr.prepend_keymap = [
          {
            on = "T";
            run = "plugin toggle-pane max-preview";
          }
          {
            on = "F";
            run = "plugin smart-filter";
          }
          {
            on = "H";
            run = "plugin bypass reverse";
          }
          {
            on = "l";
            run = "plugin bypass smart-enter";
          }
        ];
      };
      plugins = with pkgs.yaziPlugins; {
        inherit bypass toggle-pane full-border yatline yatline-catppuccin git smart-filter;
      };
    };
  };
}
