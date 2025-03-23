{pkgs, ...}: {
  enable = true;
  enableCompletion = false;
  autocd = true;

  initExtra = ''
    # 🔌 OhMyZsh + Aliases (with Zinit plugins manager)
    source ${pkgs.zinit}/share/zinit/zinit.zsh

    zinit depth"1" wait lucid nocd light-mode for \
      zsh-users/zsh-syntax-highlighting \
      atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
      zsh-users/zsh-completions \
      jeffreytse/zsh-vi-mode \
      aloxaf/fzf-tab \
      hlissner/zsh-autopair \
      phucleeuwu/ohmyzsh-aliases \
      OMZL::clipboard.zsh \
      OMZP::sudo \
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
