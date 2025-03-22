{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    fonts = {
      monospace = {
        package = pkgs.maple-mono;
        name = "Maple Mono";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };
  };
}
