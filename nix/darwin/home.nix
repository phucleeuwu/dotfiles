{ ... }:

{
  home.stateVersion = "25.05"; # Don't change unless necessary.
  xdg.enable = true;

  imports = [
    ../home/default.nix
    # inputs.LazyVim.homeManagerModules.default
  ];

  # system wide catppuccin
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "teal";
  };

  # enable or disable programs
  starship.enable = true;
  programs.git.delta.enable = true;
  aerospace.enable = true;
  fish.enable = true;
  ghostty.enable = false;

  # programs.lazyvim = {
  #   enable = true;
  # };
}
