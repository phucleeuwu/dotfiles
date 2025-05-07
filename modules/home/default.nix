{
  config,
  flake,
  pkgs,
  lib,
  ...
}: {
  imports =
    [
      ./shell/aliases.nix
      # ./shell/zsh.nix
      ./shell/fish.nix
      # ./shell/nushell.nix
      ./shell/starship.nix
      # ./shell/oh-my-posh.nix
      # ./shell/tmux.nix
      # ./shell/zellij.nix

      ./cli-tui/atuin.nix
      ./cli-tui/bat.nix
      ./cli-tui/carapace.nix
      ./cli-tui/clock-rs.nix
      ./cli-tui/eza.nix
      ./cli-tui/fastfetch.nix
      ./cli-tui/fd.nix
      ./cli-tui/fzf.nix
      ./cli-tui/git.nix
      ./cli-tui/lazygit.nix
      ./cli-tui/neovim.nix
      ./cli-tui/pay-respects.nix
      ./cli-tui/ripgrep.nix
      ./cli-tui/yazi.nix
      ./cli-tui/zoxide.nix
      ./cli-tui/navi.nix
      ./cli-tui/tealdeer.nix
      ./cli-tui/television.nix
      ./cli-tui/nh.nix
      ./cli-tui/jujutsu.nix
      # ./cli-tui/lsd.nix
      # ./cli-tui/gh-dash.nix
      # ./cli-tui/helix.nix

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
      spotify
      chatgpt
      onefetch
    ];
  };
  catppuccin = {
    mako.enable = false;
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
}
