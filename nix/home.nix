{...}: {
  imports = [
    ./home/default.nix
  ];
  home.stateVersion = "25.05"; # Don't change unless necessary.
  xdg.enable = true;
  # system wide catppuccin
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "peach";
  };
  # enable or disable programs
  fish.enable = true;
  starship.enable = true;
  zellij.enable = true;
  programs.git.delta.enable = true;
}
