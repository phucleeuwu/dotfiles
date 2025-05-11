{
  config,
  flake,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.darwinModules.default
  ];
  nixpkgs.overlays = [
    (final: _prev: {
      generated = (import ../../_sources/generated.nix) {
        inherit
          (final)
          fetchurl
          fetchgit
          fetchFromGitHub
          dockerTools
          ;
      };
    })
  ];
  networking.hostName = "192";
  nix.enable = false;
  nixos-unified.sshTarget = "myuser@myhost";
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;
}
