{pkgs, ...}: {
  xdg.configFile."sketchybar" = {
    source = ./config;
    recursive = true;
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };
  xdg.configFile."sketchybar/sketchybarrc" = {
    text = ''
      #!/usr/bin/env ${pkgs.lua54Packages.lua}/bin/lua

      package.cpath = package.cpath .. ";${pkgs.sbarlua}/lib/?.so"

      -- Load the sketchybar-package and prepare the helper binaries
      require("helpers")
      require("init")
    '';
    executable = true;
    onChange = "${pkgs.aerospace-fork}/bin/aerospace reload-config";
  };
}
