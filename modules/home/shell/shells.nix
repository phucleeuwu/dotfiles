{pkgs, ...}: {
  programs = {
  zsh = {
    enable = false;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    prezto = {
      enable = false;
      editor.keymap = "vi";
    };
    plugins = [
      {
        name = "fzf-tab";
        inherit (pkgs.zsh-fzf-tab) src;
      }
    ];
  };
    fish = {
    enable = true;
    preferAbbrs = true;
    interactiveShellInit = "
      set fish_greeting
      fish_vi_key_bindings
    ";
    plugins = [
      {
        name = "fzf-fish";
        inherit (pkgs.fishPlugins.fzf-fish) src;
      }
    ];
  };
  nushell = {
    enable = false;
    settings = {
      show_banner = false;
      edit_mode = "vi";
    };
    shellAliases = {
      ls = "ls";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -la";
    };
  };
};
}
