{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.zoxide.enable = lib.mkEnableOption "zoxide";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.zoxide.enable {
    programs.zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
  };
}
