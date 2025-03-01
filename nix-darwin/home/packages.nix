{ pkgs, ... }:

{
  home.packages = [
    pkgs.nerd-fonts.hack
    pkgs.aerospace
    pkgs.atuin
    pkgs.bat
    pkgs.bun
    pkgs.coreutils
    pkgs.curl
    pkgs.delta
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.fzf
    pkgs.gh
    pkgs.git
    pkgs.helix
    pkgs.iina
    pkgs.lazygit
    pkgs.neovim
    pkgs.nodejs
    pkgs.oh-my-posh
    pkgs.onefetch
    pkgs.raycast
    pkgs.ripgrep
    pkgs.spotify
    pkgs.starship
    pkgs.stow
    pkgs.tmux
    pkgs.yazi
    pkgs.zinit
    pkgs.zoxide
    pkgs.zsh
  ];
}
