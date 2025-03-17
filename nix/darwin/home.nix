{ ... }:

{
  home.stateVersion = "25.05"; # Don't change unless necessary.
  xdg.enable = true;

  imports = [
    ../home/default.nix
  ];

  # system wide catppuccin
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "sapphire";
  };

  # enable or disable programs
  fish.enable = true;
  starship.enable = true;
  programs.git.delta.enable = true;
  aerospace.enable = true;
}
