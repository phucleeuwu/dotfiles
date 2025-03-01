{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      gs = "git status";
    };

    initExtra = ''
      # ✨ Some settings with `#` are disabled. You can remove `#` to enable them, except for the line with emoji

      # touch ~/.hushlogin && echo " $(date '+%Y-%m-%d  %H:%M')" | lolcat 

      # 🌙 Environment Variables
      export XDG_CONFIG_HOME="$HOME/.config"
      export PATH="$HOME/.local/bin:$PATH"

      # 🚀 Load Shell Prompt
      eval "$(${pkgs.starship}/bin/starship init zsh)"
      eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${pkgs.oh-my-posh}/themes/pure.omp.json)"

      # 🐢 Atuin (Better Shell History)
      eval "$(${pkgs.atuin}/bin/atuin init zsh)"

      # 🐄 Cowsay (For Fun)
      # ${pkgs.zinit}/bin/zinit depth"1" lucid nocd light-mode atload"joke | lolcat" for phucleeuwu/cowsay.zsh

      # 🔌 OhMyZsh + Aliases (with Zinit plugins manager)
      source ${pkgs.zinit}/bin/zinit.zsh
      zinit depth"1" lucid nocd light-mode for phucleeuwu/my.zsh
    '';
  };
}
