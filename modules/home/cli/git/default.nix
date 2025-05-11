{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.git.enable = lib.mkEnableOption "git";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.git.enable {
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
  };
}
