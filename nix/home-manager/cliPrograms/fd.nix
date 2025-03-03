{ config, pkgs, ... }:

{
  enable = true;
  hidden = true;
  ignores = [
    ".git/"
    "*.bak"
  ];
  extraOptions = [
    # "--smart-case"
  ];
}
