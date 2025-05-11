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

    ./gui/kitty.nix
    # ./gui/obs-studio.nix
    # ./gui/qutebrowser.nix
    # ./gui/wezterm.nix
    # ./gui/ghostty.nix
    # ./gui/zed-editor.nix
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
      yazi.enable = true;
      atuin.enable = true;
      bat.enable = true;
      carapace.enable = true;
      clock-rs.enable = true;
      eza.enable = true;
      fastfetch.enable = true;
      fd.enable = true;
      fzf.enable = true;
      git.enable = true;
      lazygit.enable = true;
      neovim.lazyvim.enable = true;
      pay-respects.enable = true;
      ripgrep.enable = true;
      zoxide.enable = true;
      tealdeer.enable = true;
      nh.enable = true;
      jujutsu.enable = false;
      btop.enable = false;
      helix.enable = false;
      navi.enable = false;
    };
  };
}
