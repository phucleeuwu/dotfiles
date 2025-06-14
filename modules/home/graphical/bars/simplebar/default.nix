{
  config,
  lib,
  flake,
  ...
}: let
  inherit (flake.config.me) namespace;
in {
  options.${namespace}.graphical.bars.simplebar.enable = lib.mkEnableOption "simplebar";
  config = lib.mkIf config.${namespace}.graphical.bars.simplebar.enable {
    # home.file = {
    #   "Library/Application Support/Übersicht/widgets/simple-bar" = {
    #     source = inputs.simple-bar;
    #     recursive = true;
    #   };
    #   ".simplebarrc".source = ./.simplebarrc;
    # };
  };
}
