{flake, ...}: {
  programs.git = {
    enable = true;
    userName = flake.config.me.fullname;
    userEmail = flake.config.me.email;
    delta = {
      enable = true;
      options = {
        side-by-side = false;
        true-color = "always";
        hyperlinks = true;
        line-numbers = true;
      };
    };
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "osxkeychain"; # macOS Keychain for credentials
    };
  };
}
