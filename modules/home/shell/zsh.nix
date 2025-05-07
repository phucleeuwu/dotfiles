{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    prezto = {
      enable = true;
      editor.keymap = "vi";
    };
    plugins = [
      {
        name = "fzf-tab";
        inherit (pkgs.zsh-fzf-tab) src;
      }
    ];
  };
}
