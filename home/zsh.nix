{ config, pkgs, ... }:

{
  enable = true;
  enableCompletion = true;

  initExtra = ''
    # 🔌 OhMyZsh + Aliases (with Zinit plugins manager)
    source ${pkgs.zinit}/share/zinit/zinit.zsh
    zinit depth"1" lucid nocd light-mode for phucleeuwu/my.zsh
  '';
}
