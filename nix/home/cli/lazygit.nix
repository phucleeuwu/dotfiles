_:

{
  enable = true;

  settings = {
    gui = {
      scrollHeight = 10; # how many lines you scroll by
      scrollPastBottom = false; # enable scrolling past the bottom
      sidePanelWidth = 0.25; # number from 0 to 1
      expandFocusedSidePanel = true;
      commitLength.show = true;
      showBottomLine = false; # for hiding the bottom information line (unless it has important information to tell you)
      nerdFontsVersion = "3"; # nerd fonts version to use ("2" or "3"); empty means don't show nerd font icons
      commandLogSize = 5;
      showDivergenceFromBaseBranch = "arrowAndNumber";
      filterMode = "fuzzy";
      showPanelJumps = false;
      skipRewordInEditorWarning = false; # for skipping the confirmation before launching the reword editor
      border = "rounded"; # one of 'single' | 'double' | 'rounded' | 'hidden'
      statusPanelView = "dashboard";
    };

    git = {
      paging = {
        colorArg = "always";
        pager = "delta --paging=never --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
      };
    };
  };
}
