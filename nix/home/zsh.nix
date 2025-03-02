{ config, pkgs, ... }:

{
  enable = true;
  enableCompletion = true;

  initExtra = ''
    # 🔌 OhMyZsh + Aliases (with Zinit plugins manager)
    source ${pkgs.zinit}/share/zinit/zinit.zsh

    zinit depth"1" wait lucid nocd light-mode for \
      atinit"unalias zi" \
      zsh-users/zsh-syntax-highlighting \
      atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
      zsh-users/zsh-completions \
      pick"themes/catppuccin_mocha-zsh-syntax-highlighting.zsh" \
      catppuccin/zsh-syntax-highlighting \
      jeffreytse/zsh-vi-mode \
      aloxaf/fzf-tab \
      hlissner/zsh-autopair \
      fdellwing/zsh-bat \
      tarrasch/zsh-bd \
      phucleeuwu/yazi-zoxide.zsh \
      phucleeuwu/navi-plus-plus.zsh \
      phucleeuwu/om.zsh-aliases \
      OMZL::clipboard.zsh \
      OMZP::brew \
      OMZP::sudo \
      OMZP::eza \
      OMZP::zoxide \
      OMZP::alias-finder \
      OMZP::fzf \
      OMZP::copypath \
      OMZP::copyfile \
      OMZP::gitignore \
      OMZP::git \
      OMZP::git-auto-fetch \
      OMZP::magic-enter
  '';
}
