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
}
