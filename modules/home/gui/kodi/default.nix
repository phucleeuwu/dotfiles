{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.gui.kodi.enable = lib.mkEnableOption "kodi";
  config = lib.mkIf config.${flake.config.me.namespace}.gui.kodi.enable {
    programs.kodi = {
      enable = true;
    };
  };
}
