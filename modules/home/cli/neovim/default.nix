{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.editor.neovim = {
    lazyvim.enable = lib.mkEnableOption "neovim.lazyvim";
    nvchad.enable = lib.mkEnableOption "neovim.nvchad";
  };
  config = lib.mkIf (config.${flake.config.me.namespace}.editor.neovim.lazyvim.enable || config.${flake.config.me.namespace}.editor.neovim.nvchad.enable) {
    home.sessionVariables.EDITOR = "nvim";
  };
}
