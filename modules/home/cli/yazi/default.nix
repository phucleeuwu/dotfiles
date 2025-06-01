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
      initLua = ''
        require("full-border"):setup()
        require("yatline"):setup(0,require("yatline-catppuccin"):setup("mocha"))
        require("git"):setup()
        require("yatline-githead"):setup()
      '';
      settings = {
        mgr.show_hidden = true;
        preview = {
          wrap = "yes";
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
      plugins = {
        inherit (pkgs.yaziPlugins) git smart-filter full-border toggle-pane bypass yatline yatline-catppuccin yatline-githead;
      };
    };
  };
}
