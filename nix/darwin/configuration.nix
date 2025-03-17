{ pkgs, ... }:

{
  nix.enable = false;
  system.stateVersion = 6;
  security.pam.services.sudo_local.touchIdAuth = true;

  programs.fish.enable = true; # macOs default shell
  environment.shells = [ pkgs.fish ];

  imports = [
    ./system.nix # macos-settings
  ];

  environment.systemPackages = [
    pkgs.arc-browser
    pkgs.raycast
    pkgs.iina
  ];

  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "ghostty"
      "messenger"
    ];
    # Declarative nature of homebrew
    onActivation.cleanup = "zap";
  };
}
