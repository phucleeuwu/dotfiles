{ config, pkgs, ... }:

{
  home.file = {
    # Example dotfiles
    # ".zshrc".source = ./dotfiles/zshrc;
    # ".gitconfig".source = ./dotfiles/gitconfig;
  };

  # The one I use:
  programs = {
    atuin = import ../home/atuin.nix {inherit config pkgs;};
    bat = import ../home/bat.nix {inherit config pkgs;};
    eza = import ../home/eza.nix {inherit config pkgs;};
    fish = import ../home/fish.nix {inherit config pkgs;};
    fzf = import ../home/fzf.nix {inherit config pkgs;};
    # ghostty = import ../home/ghostty.nix {inherit config pkgs;};
    git = import ../home/git.nix {inherit config pkgs;};
    nushell = import ../home/nushell.nix {inherit config pkgs;};
    oh-my-posh = import ../home/oh-my-posh.nix {inherit config pkgs;};
    starship = import ../home/starship.nix {inherit config pkgs;};
    zoxide = import ../home/zoxide.nix {inherit config pkgs;};
    zsh = import ../home/zsh.nix {inherit config pkgs;};
  };
}
