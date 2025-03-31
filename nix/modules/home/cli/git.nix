_: {
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      delta = {
        side-by-side = false;
        true-color = "always";
        hyperlinks = true;
        line-numbers = true;
      };
      credential.helper = "osxkeychain"; # macOS Keychain for credentials
    };
  };
  programs.git.delta.enable = true;
}
