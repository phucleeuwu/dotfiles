_: {
  enable = true;
  daemon.enable = true;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  enableZshIntegration = true;
  flags = [
  "--disable-up-arrow"
  ];
  settings = {
    auto_sync = true;
    search_mode = "fuzzy";
    style = "compact";
    inline_height = 20;
    enter_accept = true;
    keymap_mode = "vim-insert";
    records = true;
  };
}
