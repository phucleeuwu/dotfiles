{config, pkgs, lib, flake, ...}: {
  options.${flake.config.me.namespace}.cli.ripgrep.enable = lib.mkEnableOption "ripgrep";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.ripgrep.enable {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--max-columns=150"
      "--max-columns-preview"
      "--hidden"
      "--glob=!.git/*"
      "--smart-case"
    ];
  };
};
}
