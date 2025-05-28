{
  config,
  lib,
  flake,
  ...
}: {
  imports = [./all.nix];
  options.${flake.config.me.namespace}.shell.prompt = {
    starship.enable = lib.mkEnableOption "shell.prompt.starship";
    oh-my-posh.enable = lib.mkEnableOption "shell.prompt.oh-my-posh";
  };
}
