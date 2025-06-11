{
  config,
  pkgs,
  lib,
  flake,
  ...
}: let
  inherit (flake) inputs;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  options.${flake.config.me.namespace}.gui.spotify.enable = lib.mkEnableOption "spotify";
  config = lib.mkIf config.${flake.config.me.namespace}.gui.spotify.enable {
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        keyboardShortcut
        hidePodcasts
        beautifulLyrics
      ];
      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];
    };
  };
}
