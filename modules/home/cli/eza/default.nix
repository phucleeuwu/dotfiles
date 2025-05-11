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
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      git = true;
      icons = "auto";
      colors = "auto";
      extraOptions = ["--group-directories-first"];
    };
  };
}
