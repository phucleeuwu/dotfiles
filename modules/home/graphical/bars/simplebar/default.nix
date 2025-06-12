{
  config,
  lib,
  flake,
  ...
}: let
  namespace = flake.config.me.namespace;
in {
  options.${namespace}.graphical.bars.simplebar.enable = lib.mkEnableOption "simplebar";
  config =
    lib.mkIf config.${namespace}.bars.simplebar.enable {
    };
}
