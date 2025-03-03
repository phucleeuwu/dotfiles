{ config, pkgs, ... }:

{
  enable = true;
  enableFishIntegration = true;
  # enableNushellIntegration = true;
  enableZshIntegration = true;
  defaultOptions = [
    "--height 40%"
    "--border"
  ];
  colors = {
    bg = "#1e1e2e";
    "bg+" = "#313244";
    spinner = "#f5e0dc";
    hl = "#f38ba8";
    fg = "#cdd6f4";
    header = "#f38ba8";
    info = "#cba6f7";
    pointer = "#f5e0dc";
    marker = "#b4befe";
    "fg+" = "#cdd6f4";
    prompt = "#cba6f7";
    "hl+" = "#f38ba8";
    "selected-bg" = "#45475a";
  };
}
