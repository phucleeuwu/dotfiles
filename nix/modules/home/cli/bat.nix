{
  config,
  pkgs,
  ...
}: {
  programs.bat = {
    enable = true;
    config = {
      italic-text = "always";
      style = "full";
      color = "always";
      decorations = "always";
    };
    extraPackages = with pkgs.bat-extras; [
      batgrep
      batdiff
      batman
    ];
  };
}
