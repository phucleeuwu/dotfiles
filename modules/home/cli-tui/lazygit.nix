_: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        expandFocusedSidePanel = true;
        showBottomLine = false;
        nerdFontsVersion = "3"; # "2" or "3", empty means no icons
      };
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --paging=never --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
        };
      };
    };
  };
}
