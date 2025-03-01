{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      # 🚀 Load Shell Prompt
      # eval "$(${pkgs.starship}/bin/starship init zsh)"
      eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${pkgs.oh-my-posh}/share/oh-my-posh/themes/pure.omp.json)"

      # 🐢 Atuin (Better Shell History)
      eval "$(${pkgs.atuin}/bin/atuin init zsh)"

      # 🔌 OhMyZsh + Aliases (with Zinit plugins manager)
      source ${pkgs.zinit}/share/zinit/zinit.zsh
      zinit depth"1" lucid nocd light-mode for phucleeuwu/my.zsh
    '';
  };
}
