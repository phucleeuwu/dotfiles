{ inputs, ... }:

{
  home.stateVersion = "25.05"; # Don't change unless necessary.
  xdg.enable = true;

  imports = [
    ../home/default.nix
    inputs.lazyvim.homeManagerModules.default
  ];

  # system wide catppuccin
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  # enable or disable programs
  starship.enable = true;
  programs.git.delta.enable = true;
  aerospace.enable = true;
  fish.enable = true;
  ghostty.enable = false;

  programs.lazyvim = {
    enable = true;
    extras = {
      coding = {
        mini-surround.enable = true;
        yanky.enable = true;
      };
      editor = {
        dial.enable = true;

        inc-rename.enable = true;
      };
      lang = {
        nix.enable = true;
      };
      test = {
        core.enable = true;
      };
      util = {
        dot.enable = true;
        mini-hipatterns.enable = true;
      };
      # ai = {
      #   copilot.enable = true;  
      #   copilot-chat.enable = true;
      # };
    };
  };
}
