{ ... }:

{
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;

  imports = [
    ./homebrew.nix 
    ./system.nix  #macos-settings
    ./packages.nix
  ];
}
