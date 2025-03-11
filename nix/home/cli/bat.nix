{ config, pkgs, ... }:

{
  enable = true;
  config = {
    italic-text = "always";
    style = "full";
    color = "always";
    decorations = "always";
    paging = "never";
  };
}
