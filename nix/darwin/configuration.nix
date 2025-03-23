{pkgs, ...}: {
  imports = [
    ./system.nix # macos-settings
  ];
  nix.enable = false; # for determinate nix
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;

  programs.fish.enable = true; # macOs default shell
  environment.shells = [pkgs.fish];

  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "ghostty"
    ];
    onActivation.cleanup = "zap"; # Declarative nature of homebrew
  };

  services.jankyborders = {
    enable = true;
    order = "above";
  };
}
