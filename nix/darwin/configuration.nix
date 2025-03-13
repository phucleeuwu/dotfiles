{ ... }:

{
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;
  nix.enable = false;

  imports = [
    ./homebrew.nix 
    ./system.nix  #macos-settings
    ./packages.nix
  ];
}
