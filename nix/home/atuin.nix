{ config, pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;
  enableNushellIntegration = true;
  enableFishIntegration = true;
  settings = {
    auto_sync = true;
    update_check = false;
    search_mode = "fuzzy";
    style = "full";
    inline_height = 0;
    enter_accept = true;
    keymap_mode = "vim-insert";
  };
}
