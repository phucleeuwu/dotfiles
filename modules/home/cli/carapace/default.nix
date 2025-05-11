{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.carapace.enable = lib.mkEnableOption "carapace";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.carapace.enable {
    programs.carapace = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
