{config, pkgs, lib, flake, ...}: {
  options.${flake.config.me.namespace}.cli.navi.enable = lib.mkEnableOption "navi";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.navi.enable {
  programs.navi = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # enableNushellIntegration = true;
  };
};
}
