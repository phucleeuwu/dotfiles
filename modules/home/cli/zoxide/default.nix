{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.zoxide.enable = lib.mkEnableOption "zoxide";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
  };
}
