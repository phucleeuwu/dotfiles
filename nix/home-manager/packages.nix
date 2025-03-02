{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.atuin
    pkgs.bat
    pkgs.bun
    pkgs.coreutils
    pkgs.curl
    pkgs.delta
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.fish
    pkgs.fzf
    pkgs.gh
    pkgs.git
    pkgs.helix
    pkgs.lazygit
    pkgs.nchat
    pkgs.nushell
    pkgs.neovim
    pkgs.nerd-fonts.hack
    pkgs.nodejs
    pkgs.oh-my-posh
    pkgs.onefetch
    pkgs.ripgrep
    pkgs.starship
    pkgs.stow
    pkgs.tmux
    pkgs.yazi
    pkgs.zinit
    pkgs.zoxide
    pkgs.zsh
  ];
}
