{
  flake,
  pkgs,
  ...
}: {
  imports = [
    ./cli/default.nix
    ./gui/default.nix
    ./shell/default.nix
    ./WM/default.nix
  ];
  xdg.enable = true;
  home = {
    stateVersion = "25.05";
    inherit (flake.config.me) username;
    packages = with pkgs; [
      maple-mono.NF
      onefetch
      uutils-coreutils-noprefix
      spotify
    ];
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  # config
  ${flake.config.me.namespace} = {
    WM = {
      darwin.enable = true;
      linux.enable = false;
    };
    shell = {
      zsh.enable = false;
      fish.enable = true;
      nushell.enable = false;
      prompt = {
        starship.enable = true;
        oh-my-posh.enable = false;
      };
      multiplexer = {
        tmux.enable = false;
        zellij.enable = false;
      };
    };
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
      jujutsu.enable = true;
      btop.enable = false;
      helix.enable = false;
      navi.enable = false;
    };
    terminal = {
      wezterm.enable = false;
      kitty.enable = false;
      ghostty.enable = false;
    };
    editor = {
      zed-editor.enable = false;
      neovim = {
        lazyvim.enable = true;
        nvchad.enable = false;
      };
    };
    gui = {
      obs-studio.enable = false;
      qutebrowser.enable = false;
      kodi.enable = false;
    };
  };
}
