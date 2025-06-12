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
  options.${flake.config.me.namespace}.graphical.apps.spotify.enable = lib.mkEnableOption "spotify";
  config = lib.mkIf config.${flake.config.me.namespace}.graphical.apps.spotify.enable {
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
    };
  };
}
