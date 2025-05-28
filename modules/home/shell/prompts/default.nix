{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.shells.prompts = {
    starship.enable = lib.mkEnableOption "shells.prompts.starship";
    oh-my-posh.enable = lib.mkEnableOption "shells.prompts.oh-my-posh";
  };
}
