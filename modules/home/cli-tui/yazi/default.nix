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
      full-border = pkgs.yaziPlugins.full-border;
      yatline = pkgs.yaziPlugins.yatline;
      yatline-catppuccin = pkgs.yaziPlugins.yatline-catppuccin;
      git = pkgs.yaziPlugins.git;
      smart-enter = pkgs.yaziPlugins.smart-enter;
      smart-filter = pkgs.yaziPlugins.smart-filter;
    };
  };
}
