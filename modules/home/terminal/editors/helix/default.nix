{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.terminal.editors.helix.enable = lib.mkEnableOption "helix";
  config = lib.mkIf config.${flake.config.me.namespace}.terminal.editors.helix.enable {
    programs.helix = {
      enable = true;
      settings = {
        editor = {
          line-number = "relative";
          cursorline = true;
          color-modes = true;
          lsp.display-messages = true;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          indent-guides = {
            render = true;
          };
        };
      };
    };
  };
}
