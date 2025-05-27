{
  flake,
  pkgs,
  ...
}: {
  imports = [
    ./kodi/default.nix
    ./terminal/default.nix
    ./obs-studio/default.nix
    ./zed-editor/default.nix
    ./qutebrowser/default.nix
  ];
}
