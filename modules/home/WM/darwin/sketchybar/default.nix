{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  config = lib.mkIf config.${flake.config.me.namespace}.WM.darwin.enable {
    home.packages = [pkgs.sketchybar-app-font];
    programs.sketchybar = {
      enable = true;
      extraPackages = [pkgs.aerospace];
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
