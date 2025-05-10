{pkgs, ...}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sbarlua = prev.callPackage ./sbarlua.nix {};
    })
  ];
  services.sketchybar = {
    enable = true;
    extraPackages = [
      pkgs.aerospace
    ];
  };
}
