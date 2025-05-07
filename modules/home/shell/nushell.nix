_: {
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
      edit_mode = "vi";
    };
    shellAliases = {
      ls = "ls";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
    };
  };
}
