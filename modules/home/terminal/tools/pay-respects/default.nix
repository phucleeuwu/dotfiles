{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.pay-respects.enable = lib.mkEnableOption "pay-respects";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.pay-respects.enable {
    programs.pay-respects.enable = true;
  };
}
