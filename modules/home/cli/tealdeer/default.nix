{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.tealdeer.enable = lib.mkEnableOption "tealdeer";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.tealdeer.enable {
    programs.tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
  };
}
