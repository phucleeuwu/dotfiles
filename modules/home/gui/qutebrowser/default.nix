{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.gui.qutebrowser.enable = lib.mkEnableOption "qutebrowser";
  config = lib.mkIf config.${flake.config.me.namespace}.gui.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
      settings = {
        window.hide_decoration = true;
      };
    };
  };
}
