{
  config,
  pkgs,
  lib,
  flake,
  ...
}: let
  inherit (flake.config.me) namespace;
in {
  options.${namespace}.terminal.tools.yazi.enable = lib.mkEnableOption "yazi";
  config = lib.mkIf config.${namespace}.terminal.tools.yazi.enable {
    programs.yazi = {
      enable = true;
      shellWrapperName = "y";
      plugins = {
        inherit (pkgs.yaziPlugins) git smart-filter full-border toggle-pane bypass yatline yatline-catppuccin yatline-githead;
      };
      initLua = ''
        require("full-border"):setup()
        require("git"):setup()
        require("yatline"):setup(0,require("yatline-catppuccin"):setup("mocha"))
        require("yatline-githead"):setup()
      '';
      settings = {
        mgr.show_hidden = true;
        preview = {
          max_width = 1500;
          max_height = 1500;
        };
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
            on = "l";
            run = "plugin bypass smart-enter";
          }
          {
            on = "H";
            run = "plugin bypass reverse";
          }
        ];
      };
    };
  };
}
