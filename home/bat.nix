{ config, pkgs, ... }:

{
  config = {
    italic-text = "always";
    style = "full";
    color = "always";
    decorations = "always";
    paging = "never";
  };

  themes = {
    "Catppuccin Mocha" = {
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "HEAD";
        sha256 = "1lirgwgh2hnz6j60py19bbmhvgaqs7i6wf6702k6n83lgw4aixg9";
      };
      file = "themes/Catppuccin Mocha.tmTheme";
    };
  };
}
