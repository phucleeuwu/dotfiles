{
  pkgs,
  lib,
  ...
}: {
  xdg.configFile."sketchybar" = {
    source = ./.;
    recursive = true;
    onChange = "${lib.getExe pkgs.sketchybar} --reload";
  };
  xdg.configFile."sketchybar/helpers/app_icons.lua" = {
    source = "${pkgs.sketchybar-app-font}/lib/sketchybar-app-font/icon_map.lua";
  };
  xdg.configFile."sketchybar/sketchybarrc" = {
    text = ''
      #!/usr/bin/env ${lib.getExe pkgs.lua54Packages.lua}

      package.cpath = package.cpath .. ";${pkgs.sbarlua}/lib/?.so"

      -- Load the sketchybar-package and prepare the helper binaries
      require("helpers")
      require("init")
    '';
    executable = true;
  };
}
