{ config, pkgs, ... }:

{
  home.shellAliases = {
    lg = "lazygit";
    "..." = "cd ../..";
    ff = "fastfetch";
  };
}
