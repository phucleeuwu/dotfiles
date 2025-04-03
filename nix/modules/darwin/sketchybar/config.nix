{pkgs, ...}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sbarlua = prev.callPackage ./sbarlua.nix {};
    })
  ];

  homebrew = {
    casks = [
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "font-sketchybar-app-font"
    ];
  };

  services.sketchybar = {
    enable = true;
    extraPackages = [
      pkgs.aerospace-fork
    ];
  };
}
