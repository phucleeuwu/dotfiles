{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.lazygit.enable = lib.mkEnableOption "lazygit";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.lazygit.enable {
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
            pager = "delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format=\"lazygit-edit://{path}:{line}\"";
          };
        };
      };
    };
  };
}
