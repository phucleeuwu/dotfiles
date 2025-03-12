{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.enableReleaseChecks = false;
  stylix.image = pkgs.fetchurl {
    url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
    sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
  };

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };

    emoji = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };
  };
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.opacity.applications = 0.2;
  stylix.opacity.terminal = 0.2;
}
