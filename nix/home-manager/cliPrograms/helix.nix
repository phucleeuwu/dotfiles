{ config, pkgs, ... }:

{
  enable = true;
  settings = {
    theme = "catppuccin_mocha";
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

    keys.normal = {
      space.space = "file_picker";
      space.w = ":w";
      space.q = ":q";
      esc = [ "collapse_selection" "keep_primary_selection" ];
    };
  };
}

