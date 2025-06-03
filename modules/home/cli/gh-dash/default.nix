{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.gh-dash.enable = lib.mkEnableOption "gh-dash";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.gh-dash.enable {
    programs.gh-dash.enable = true;
  };
}
