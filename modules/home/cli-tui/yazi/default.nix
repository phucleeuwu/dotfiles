{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";
    initLua = ./init.lua;
    settings = {
      manager = {
        ratio = [1 3 4];
        show_hidden = true;
      };
      preview = {
        max_width = 1200;
        max_height = 1000;
      };
      opener = {
        edit = [
          {
            run = "nvim \"$@\"";
            block = true;
          }
        ];
      };
    };
    keymap = {
      manager.prepend_keymap = [
        {
          run = "plugin smart-filter";
          on = "F";
        }
        {
          run = "plugin smart-enter";
          on = "l";
        }
      ];
    };
    plugins = {
      inherit (pkgs.yaziPlugins) full-border;
      inherit (pkgs.yaziPlugins) yatline;
      inherit (pkgs.yaziPlugins) yatline-catppuccin;
      inherit (pkgs.yaziPlugins) git;
      inherit (pkgs.yaziPlugins) smart-enter;
      inherit (pkgs.yaziPlugins) smart-filter;
    };
  };
}
