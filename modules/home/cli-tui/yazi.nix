_: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";
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
  };
}
