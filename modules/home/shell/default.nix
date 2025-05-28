{
  config,
  lib,
  flake,
  ...
}: {
  imports = [
    ./shell/default.nix
    ./prompt/default.nix
    ./multiplexer/default.nix
    ./alias/default.nix
  ];
  options.${flake.config.me.namespace}.shell= {
    zsh.enable = lib.mkEnableOption "shell.zsh";
    fish.enable = lib.mkEnableOption "shell.fish";
    nushell.enable = lib.mkEnableOption "shell.nushell";
  };
}
