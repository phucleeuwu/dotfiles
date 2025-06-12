{
  config,
  pkgs,
  flake,
  ...
}: {
  home.shell = {
    enableZshIntegration = config.${flake.config.me.namespace}.terminal.shells.zsh.enable;
    enableFishIntegration = config.${flake.config.me.namespace}.terminal.shells.fish.enable;
    enableNushellIntegration = config.${flake.config.me.namespace}.terminal.shells.nushell.enable;
  };
  programs = {
    zsh = {
      inherit (config.${flake.config.me.namespace}.terminal.shells.zsh) enable;
      autocd = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      prezto = {
        inherit (config.${flake.config.me.namespace}.terminal.shells.zsh) enable;
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
      inherit (config.${flake.config.me.namespace}.terminal.shells.fish) enable;
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
      inherit (config.${flake.config.me.namespace}.terminal.shells.nushell) enable;
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
