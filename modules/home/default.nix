{
  flake,
  pkgs,
  ...
}: {
  imports = [
    ./cli/default.nix
    # ./gui/default.nix
    # ./windowManager/default.nix

    ./shell/aliases.nix
    # ./shell/zsh.nix
    ./shell/fish.nix
    # ./shell/nushell.nix
    ./shell/starship.nix
    # ./shell/oh-my-posh.nix
    # ./shell/tmux.nix
    # ./shell/zellij.nix

    ./gui/terminal/default.nix
    ./gui/obs-studio/default.nix
    ./gui/zed-editor/default.nix
    ./gui/qutebrowser/default.nix
  ];
  xdg.enable = true;
  home = {
    stateVersion = "25.05";
    inherit (flake.config.me) username;
    packages = with pkgs; [
      maple-mono.NF
      sketchybar-app-font
      spotify
      chatgpt
      onefetch
    ];
  };
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
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
        xero.enable = false;
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
      helix.enable = false;
      navi.enable = false;
    };
    terminal = {
      wezterm.enable = true;
      kitty.enable = true;
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
    };
  };
}
