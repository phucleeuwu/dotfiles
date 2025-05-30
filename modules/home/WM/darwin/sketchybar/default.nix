{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  config = lib.mkIf config.${flake.config.me.namespace}.WM.darwin.enable {
    home.packages = with pkgs; [
      sketchybar-app-font
      switchaudio-osx
      nowplaying-cli
    ];
    xdg.configFile = {
      "sketchybar" = {
        source = ./.;
        recursive = true;
      };
      "sketchybar/helpers/icon_map.lua" = {
        source = "${pkgs.sketchybar-app-font}/lib/sketchybar-app-font/icon_map.lua";
      };
      "sketchybar/sketchybarrc" = {
        executable = true;
        text = ''
          #!/usr/bin/env ${lib.getExe pkgs.lua54Packages.lua}
          package.cpath = package.cpath .. ";${pkgs.lua54Packages.getLuaCPath pkgs.sbarlua}"
          require("helpers")
          require("init")
        '';
      };
    };
  };
}
