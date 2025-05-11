{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.fzf.enable = lib.mkEnableOption "fzf";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.fzf.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      # enableNushellIntegration = true;
      defaultOptions = [
        "--height 40%"
        "--border"
      ];
    };
  };
}
