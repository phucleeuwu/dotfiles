{pkgs, ...}: {
  nix.enable = false;
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;

  programs.fish.enable = true; # macOs default shell
  environment.shells = [pkgs.fish];

  imports = [
    ./system.nix # macos-settings
  ];

  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "ghostty"
    ];
    onActivation.cleanup = "zap"; # Declarative nature of homebrew
  };
}
