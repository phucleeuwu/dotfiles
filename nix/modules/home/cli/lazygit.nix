_: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        scrollHeight = 10; # How many lines you scroll by
        scrollPastBottom = false; # Enable scrolling past the bottom
        sidePanelWidth = 0.25; # Number from 0 to 1
        expandFocusedSidePanel = true;
        commitLength.show = true;
        showBottomLine = false; # Hide bottom information line unless important
        nerdFontsVersion = "3"; # Nerd fonts version ("2" or "3"), empty means no icons
        commandLogSize = 5;
        showDivergenceFromBaseBranch = "arrowAndNumber";
        filterMode = "fuzzy";
        showPanelJumps = false;
        skipRewordInEditorWarning = false; # Skip confirmation before rewording
        border = "rounded"; # One of 'single' | 'double' | 'rounded' | 'hidden'
        statusPanelView = "dashboard";
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
