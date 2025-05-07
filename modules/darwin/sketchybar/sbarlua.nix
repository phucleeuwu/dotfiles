{
  pkgs,
  lib,
  stdenv,
}:
stdenv.mkDerivation {
  inherit (pkgs.generated.sbarlua) pname version src;

  buildInputs = with pkgs;
    [
      gcc
      readline
    ]
    ++ lib.optionals stdenv.hostPlatform.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
    ];

  buildPhase = ''
    make bin/sketchybar.so
  '';

  installPhase = ''
    mkdir -p $out/lib
    mv bin/sketchybar.so $out/lib/sketchybar.so
  '';

  meta = {
    description = "A Lua API for SketchyBar";
    homepage = "git@github.com:FelixKratz/SbarLua.git";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [davsanchez];
    platforms = lib.platforms.darwin;
  };
}
