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
          run = "plugin smart-filter";
          on = "F";
        }
        {
          run = "plugin smart-enter";
          on = "l";
        }
      ];
    };
plugins = with pkgs.yaziPlugins; {
  inherit full-border yatline yatline-catppuccin git smart-enter smart-filter;
};
  };
}
