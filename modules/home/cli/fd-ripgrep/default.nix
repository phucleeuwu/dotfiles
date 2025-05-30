{
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.cli = {
    fd.enable = lib.mkEnableOption "cli.fd";
    ripgrep.enable = lib.mkEnableOption "cli.ripgrep";
  };
}
