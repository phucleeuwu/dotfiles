{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    # OhMyZsh plugins
    initExtra = ''
      source ${pkgs.zinit}/share/zinit/zinit.zsh
      zinit depth"1" wait lucid nocd light-mode for \
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
  };
}
