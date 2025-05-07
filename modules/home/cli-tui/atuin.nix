_: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      auto_sync = true;
      records = true;
      search_mode = "fuzzy";
      style = "compact";
      inline_height = 20;
      enter_accept = true;
      keymap_mode = "vim-insert";
    };
  };
}
