{ config, pkgs, ... }:

{
  enable = true;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  enableZshIntegration = true;
  settings = {
    auto_sync = true;
    search_mode = "fuzzy";
    # style = "full";
    inline_height = 20;
    enter_accept = true;
    keymap_mode = "vim-normal";
    records = true;
  };
}
