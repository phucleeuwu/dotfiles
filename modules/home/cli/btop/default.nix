{
  config,
  lib,
  pkgs,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.btop.enable = lib.mkEnableOption "btop";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.btop.enable {
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
  };
}
