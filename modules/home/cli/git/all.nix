{
  config,
  lib,
  flake,
  ...
}: {
  programs.git = {
    inherit (config.${flake.config.me.namespace}.cli.git) enable;
    delta = {
      inherit (config.${flake.config.me.namespace}.cli.git.delta) enable;
    };
    userName = flake.config.me.name;
    userEmail = flake.config.me.email;
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "osxkeychain"; # macOS Keychain for credentials
    };
  };
}
