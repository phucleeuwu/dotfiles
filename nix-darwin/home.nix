{ config, pkgs, ... }: {
  home.username = "phuc";
  home.homeDirectory = "/Users/phuc";

  home.packages = with pkgs; [ neofetch bat ripgrep ];
  programs.git.enable = true;

  home.stateVersion = "23.11"; # Adjust based on your Nix version
}
