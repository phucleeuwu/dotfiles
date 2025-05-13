{config,pkgs,lib,flake,...}: {
  options.${flake.config.me.namespace}.gui.obs-studio.enable = lib.mkEnableOption "obs-studio";
  config = lib.mkIf config.${flake.config.me.namespace}.gui.obs-studio.enable {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };
};
}
