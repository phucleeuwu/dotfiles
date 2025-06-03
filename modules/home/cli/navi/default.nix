{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.navi.enable = lib.mkEnableOption "navi";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.navi.enable {
    programs.navi.enable = true;
  };
}
