{pkgs, ...}: {
  programs.fish = {
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
}
