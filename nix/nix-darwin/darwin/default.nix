{ pkgs, config, ... }:

{
  imports = [
    ./homebrew.nix  #homebrew
    ./system.nix  #macos-settings
    ./packages.nix
  ];
}
