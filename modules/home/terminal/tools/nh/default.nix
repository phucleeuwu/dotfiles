{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.nh.enable = lib.mkEnableOption "nh";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.nh.enable {
    programs.nh = {
      enable = true;
      flake = builtins.toString ../../../..;
      clean.enable = true;
    };
  };
}
