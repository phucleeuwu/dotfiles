{
  config,
  lib,
  flake,
  ...
}: {
  imports = [
    ./hyprlock/default.nix
  ];
}
