{pkgs, ...}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sbarlua = prev.callPackage ./sbarlua.nix {};
    })
  ];

  homebrew = {
    casks = [
      "font-sketchybar-app-font"
    ];
  };

  services.sketchybar = {
    enable = true;
    extraPackages = [
      pkgs.aerospace
    ];
  };
}
