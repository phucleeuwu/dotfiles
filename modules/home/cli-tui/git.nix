{flake, ...}: {
  programs.git = {
    enable = true;
    delta.enable = true;
    userName = flake.config.me.name;
    userEmail = flake.config.me.email;
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "osxkeychain"; # macOS Keychain for credentials
    };
  };
}
