{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.editor.neovim = {
    lazyvim.enable = lib.mkEnableOption "neovim.lazyvim";
    nvchad.enable = lib.mkEnableOption "neovim.nvchad";
  };
  imports = [./all.nix];
}
