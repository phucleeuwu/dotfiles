{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    SHELL = "${pkgs.fish}/bin/nvim";
  };
}
