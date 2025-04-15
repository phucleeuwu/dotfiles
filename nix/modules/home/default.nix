{
  flake,
  pkgs,
  ...
}: {
  imports = [
    ./aliases.nix
    ./shell/fish.nix
    # ./shell/nushell.nix
    # ./shell/zsh.nix
    ./cli/atuin.nix
    ./cli/bat.nix
    ./cli/carapace.nix
    ./cli/eza.nix
    ./cli/fastfetch.nix
    ./cli/fd.nix
    ./cli/fzf.nix
    ./cli/git.nix
    ./cli/lazygit.nix
    ./cli/ripgrep.nix
    ./cli/starship.nix
    ./cli/yazi.nix
    ./cli/zoxide.nix
    ./cli/neovim.nix
    # ./cli/gh-dash.nix
    # ./cli/helix.nix
    # ./cli/oh-my-posh.nix
    # ./cli/tmux.nix
    # ./cli/zellij.nix
    ./gui/kitty.nix
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
    ];
  };
  # let catppuccin take care all the themes
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };
}
