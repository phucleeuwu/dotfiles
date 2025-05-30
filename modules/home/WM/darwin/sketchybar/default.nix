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
      nowplaying-cli
      switchaudio-osx
    ];
    programs.sketchybar = {
      enable = true;
      extraPackages = with pkgs; [
        aerospace
        nowplaying-cli
        switchaudio-osx
      ];
      configType = "lua";
      config = {
        source = ./.;
        recursive = true;
      };
    };
    xdg.configFile = {
      "sketchybar/helpers/icon_map.lua".source = "${pkgs.sketchybar-app-font}/lib/sketchybar-app-font/icon_map.lua";
      "sketchybar/sketchybarrc" = {
        executable = true;
        text = ''
          #!/usr/bin/env lua
          require("helpers")
          require("init")
        '';
      };
    };
  };
}
