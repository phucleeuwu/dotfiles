{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.darwinModules.default
  ];
  networking.hostName = "192";

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
  nix.enable = false; #delete this if you don't use determinate nix
  nixos-unified.sshTarget = "myuser@myhost";
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;
}
