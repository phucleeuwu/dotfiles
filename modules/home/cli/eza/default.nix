{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.eza.enable = lib.mkEnableOption "eza";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.eza.enable {
    programs.eza = {
      enable = true;
      git = true;
      icons = "auto";
      colors = "auto";
      extraOptions = ["--group-directories-first"];
    };
  };
}
