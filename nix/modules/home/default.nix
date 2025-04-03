{pkgs, ...}: {
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
    ./gui/wezterm.nix
    # ./gui/kitty.nix
    # ./gui/ghostty.nix
    # ./gui/zed-editor.nix
  ];
  home.stateVersion = "25.05";
  xdg.enable = true;
  catppuccin = {
    wezterm.apply = true; #until https://github.com/catppuccin/nix/issues/527
    enable = true;
    flavor = "mocha";
    accent = "peach";
  };
  home.packages = with pkgs; [
    maple-mono.NF
    spotify
    chatgpt
  ];
}
