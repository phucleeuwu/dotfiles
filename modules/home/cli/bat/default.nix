{config, pkgs,  lib,flake, ...}: {
  options.${flake.config.me.namespace}.cli.bat.enable = lib.mkEnableOption "bat";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.bat.enable {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batgrep
      batdiff
      batman
    ];
  };
};
}
