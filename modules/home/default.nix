{
  pkgs,
  flake,
  ...
}: {
  imports = [
    ./graphical/default.nix
    ./terminal/default.nix
  ];
  xdg.enable = true;
  home = {
    stateVersion = "25.05";
    inherit (flake.config.me) username;
    packages = with pkgs; [
      maple-mono.variable
      onefetch
      uutils-coreutils-noprefix
      localsend
    ];
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  # config
  ${flake.config.me.namespace} = {
    cli = {
      git = {
        enable = true;
        delta.enable = true;
      };
      yazi.enable = true;
      atuin.enable = true;
      bat.enable = true;
      carapace.enable = true;
      clock-rs.enable = true;
      eza.enable = true;
      fastfetch = {
        jakoolit.enable = true;
        hyde.enable = false;
        ml4w.enable = false;
      };
      fd.enable = true;
      fzf.enable = true;
      lazygit.enable = true;
      pay-respects.enable = true;
      ripgrep.enable = true;
      zoxide.enable = true;
      tealdeer.enable = true;
      nh.enable = true;
      gh-dash.enable = true;
      jujutsu.enable = false;
      btop.enable = false;
      navi.enable = false;
    };
    terminal = {
      editors = {
        neovim = {
          lazyvim.enable = true;
          nvchad.enable = false;
        };
        helix.enable = false;
      };
      emulators = {
        wezterm.enable = false;
        kitty.enable = false;
        ghostty.enable = true;
      };
      multiplexers = {
        tmux.enable = false;
        zellij.enable = true;
      };
      shells = {
        zsh.enable = false;
        fish.enable = true;
        nushell.enable = false;
        prompts = {
          starship.enable = true;
          oh-my-posh.enable = false;
        };
      };
    };
    graphical = {
      bars = {
        sketchybar.enable = false;
        simplebar.enable = true;
      };
      borders = {
        jankyborders.enable = true;
      };
      editors = {
        zed-editor.enable = false;
      };
      screenlockers = {
        hyprlock.enable = false;
      };
      wms = {
        aerospace.enable = true;
      };
    };
  };
}
