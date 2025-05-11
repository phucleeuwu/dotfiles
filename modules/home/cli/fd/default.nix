{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.fd.enable = lib.mkEnableOption "fd";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.fd.enable {
    programs.fd = {
      enable = true;
      hidden = true;
      ignores = [
        ".git/"
        "*.bak"
      ];
    };
  };
}
