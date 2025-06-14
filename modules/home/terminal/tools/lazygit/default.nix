{
  config,
  lib,
  flake,
  ...
}: let
  inherit (flake.config.me) namespace;
in {
  options.${namespace}.terminal.tools.lazygit.enable = lib.mkEnableOption "lazygit";
  config = lib.mkIf config.${namespace}.terminal.tools.lazygit.enable {
    programs.lazygit = {
      enable = true;
      settings = {
        gui = {
          expandFocusedSidePanel = true;
          showBottomLine = false;
          nerdFontsVersion = "3";
        };
        git = {
          paging = {
            colorArg = "always";
            pager = "delta --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
          };
        };
      };
    };
  };
}
