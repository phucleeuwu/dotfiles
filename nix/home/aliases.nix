{ config, pkgs, ... }:

{
  home.shellAliases = {
    lg = "lazygit";
    "..." = "cd ../..";
  };
}
